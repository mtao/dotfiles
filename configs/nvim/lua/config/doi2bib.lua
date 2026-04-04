function Doi2bib(doi)
  local output = vim.system({ "doi2bib", doi }, { text = true }):wait()

  if output.code ~= 0 then
    error("was unable to get doi for [{doi2bib}]")
  end
  --local output = vim.fn.system("doi2bib", doi)
  return output.stdout:gsub("^%s*(.-)%s*$", "%1")
end
