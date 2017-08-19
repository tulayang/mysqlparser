import ospaths, strutils

task test, "Run test tests":
  withDir thisDir():
    mkDir "bin"
    --r
    --o:"""bin/test"""
    --verbosity:0
    --path:"""."""
    setCommand "c", "test.nim"
