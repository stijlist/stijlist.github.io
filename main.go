package main

import (
  "log"
  "strings"
  // "os"
  "io"
  "fmt"
	"embed"
	"io/fs"
  "net/http"
)

//go:embed files
var embedded embed.FS
var files fs.FS = embedded

func main() {
	println("hello")
  glob, err :=  fs.Glob(files, "files/*")
  if err != nil { panic(err) }
  fmt.Printf("%s", glob)
  http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
    f, err := files.Open(strings.TrimLeft(r.URL.Path, "/"))
    if err != nil {
      w.WriteHeader(404)

      fmt.Fprintf(w, "Not found")
      return
    }
    io.Copy(w, f)
  })

  log.Fatal(http.ListenAndServe(":8080", nil))
}
