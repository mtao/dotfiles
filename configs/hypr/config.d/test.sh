#cat monitors.yml | yq  -os | xargs { print $1 }
tmpfile=$( mktemp )
cat monitors.yml | yq  -os | awk '{printf "export " $0 "\n"}' > ${tmpfile}
#cat monitors.yml | yq  -os | awk '{printf "export " $1 "\n"}'> ${tmpfile}
echo >> ${tmpfile}
cat ${tmpfile}
source ${tmpfile}
rm ${tmpfile}
#
env
