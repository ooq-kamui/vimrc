
const fs     = require('fs')
const html   = require('html')
const marked = require('marked')

function main(){
  
  const md_file_path = process.argv[2]
  
  const cntnt_md = fs.readFileSync(md_file_path, {encoding:'utf-8'})
  
  const cntnt_html = marked.parse(cntnt_md)
  
  const cntnt_out = html.prettyPrint(cntnt_html)
  
  // out
  
  const out_dir = ""
  
  const out_file_path = md_file_path + ".html"
  
  fs.writeFileSync(out_file_path, cntnt_out, "utf-8")
}

main()

