#/usr/bin/env python3

import sys
import os
import difflib
from typing import override
from pathlib import Path

mypath = os.path.dirname(os.path.realpath(__file__))
default_filename = os.path.join(mypath,"settings.txt")
default_configdir = os.path.join(mypath,"configs")


class Command:
    update_target: int = 0
    update_source: int = 1
    update_noop: int = 2
    __update_readable__: dict[int,str] = {update_target: "Target",
            update_source: "Source",
            update_noop: "NoOp"}

    def __init__(self, target: Path):
        self.__target__: Path = target

    def __type_str__(self) -> str:
        raise NotImplementedError

    def diff(self) -> list[str]:
        raise NotImplementedError

    @staticmethod
    def __get_file_age__(filename: Path):
        st = os.stat(os.path.expanduser(filename))
        return st.st_mtime


    def target_age(self) -> float:
        return Command.__get_file_age__(self.__target__)

    def source_age(self) -> float:
        raise NotImplementedError

    def target(self):
        return self.__target__

    def source(self):
        return NotImplementedError

    def update_style(self) -> int:
        if len(self.diff()) == 0:
            return Command.update_noop
        ta = self.target_age()
        na = self.source_age()

        if ta == na:
            return  Command.update_noop
        elif ta < na:
            return Command.update_target
        else:
            return Command.update_source
    def update_human_readable(self):
        return Command.__update_readable__[self.update_style()]

    @override
    def __repr__(self) -> str:
        return "{0}:[{1}],{2}".format(self.__type_str__(),self.__target__,self.update_human_readable())


class FileCommand(Command):
    @override
    def __type_str__(self):
        return "File"
    def __init__(self,target: Path,args: list[str]):
        super().__init__(target)
        self.__source__: Path = Path(os.path.join(default_configdir,args[0]))
        #TODO: this only works for text files I think?
        source_lines = open(os.path.expanduser(self.__source__),"r").readlines()
        target_lines = open(os.path.expanduser(self.__target__),"r").readlines()
        self.__diff__: list[str] = list(difflib.unified_diff(source_lines,target_lines))

    @override
    def diff(self):
        return self.__diff__


    @override
    def source_age(self):
        return Command.__get_file_age__(self.__source__)


class GitCommand(Command):
    @override
    def __type_str__(self) -> str:
        return "Git"
    @override
    def diff(self) -> list[str]:
        return []
    def __init__(self,target: Path):
        super().__init__(target)

    @override
    def source_age(self):
        return -1


def make_command(cmd: str,target: Path,args: list[str]):
    if cmd == "=":
        return FileCommand(target,args)
    elif cmd == ":git:":
        return GitCommand(target)
    else:
        raise Exception("Unknown Command {} {} [{}]".format(cmd,target,args))




class Settings:
    def __init__(self, lines: list[str]):
        self.__name__: str = lines[0][1:-1]
        print(self.__name__)
        
        #triplets of command, target, command args
        self.__commands__: list[Command] = [make_command(line[1],Path(line[0]),line[2:]) for line in map(lambda x: x.split(), lines[1:])]

    def process(self):
        for cmd in self.__commands__:
            style = cmd.update_style()
            print(cmd)
            if style is not Command.update_noop:
                print("".join(cmd.diff()))

            




def __main__():
    filename = default_filename
    if len(sys.argv) > 1:
        filename = sys.argv[1]
    with open(filename,"r") as f:
        lines = list(filter(lambda x: len(x) > 0,map(lambda x: x.strip(),  f.readlines())))
        print(lines)
        indices: list[int] = []

        for i,line in enumerate(lines):
            if line[0] == '[':
                indices.append(i)

        indices.append(len(lines))

        settings = [Settings(lines[i:j]) for i,j in zip(indices[:-1],indices[1:])]

        for s in settings:
            s.process()
        




if __name__ == "__main__":
    __main__()

