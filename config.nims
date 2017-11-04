import ospaths, strutils

proc reGenDoc(filename: string) =
  writeFile(filename,
            replace(
              replace(readFile(filename), 
                      """href="/tree/master/mysqlparser""", 
                      """href="https://github.com/tulayang/mysqlparser/tree/master/mysqlparser""" ),
              """href="/edit/devel/mysqlparser""",
              """href="https://github.com/tulayang/mysqlparser/edit/master/mysqlparser""" ))

task doc, "Generate documentation":
  exec "nim doc2 -o:$outfile --docSeeSrcUrl:$url $file" % [
    "outfile", thisDir() / "doc/mysqlparser.html",
    "url",     "https://github.com/tulayang/mysqlparser/blob/master",
    "file",    thisDir() / "mysqlparser.nim"
  ]
  reGenDoc thisDir() / "doc/mysqlparser.html"

task test, "Run test tests":
  withDir thisDir():
    mkDir "bin"
    --r
    --o:"""bin/test"""
    --verbosity:0
    --path:"""."""
    setCommand "c", "test.nim"
