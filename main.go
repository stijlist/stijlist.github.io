package main

import (
	"bufio"
	"embed"
	"flag"
	"fmt"
	"io"
	"net/http"
	"os"
	"path/filepath"
	"time"

	_ "net/http/pprof"
)

//go:embed files
var embedded embed.FS

var urls = map[string]string{
	"/":             "files/index.html",
	"/about/":       "files/about.html",
	"/css/main.css": "files/main.css",
	"/2021/10/29/investigating-python-startup-time.html":                "files/2021-10-29-investigating-python-startup-time.html",
	"/2021/05/02/intro-to-human-behavioral-biology-needs-critique.html": "files/2021-05-02-intro-to-human-behavioral-biology-needs-critique.html",
	"/2020/05/18/add-to-miniflux.html":                                  "files/2020-05-18-add-to-miniflux.html",
	"/2016/09/26/complexity-hotspots.html":                              "files/2016-09-26-complexity-hotspots.html",
	"/2015/07/30/when-object-orientation-works-a-rule-of-thumb.html":    "files/2015-07-30-when-object-orientation-works-a-rule-of-thumb.html",
	"/2014/09/15/a-procedure-for-writing.html":                          "files/2014-09-15-a-procedure-for-writing.html",
	"/2014/07/21/somewhat-measurable-tests-of-ability.html":             "files/2014-07-21-somewhat-measurable-tests-of-ability.html",
	"/2014/07/21/dotfiles-and-navel-gazing.html":                        "files/2014-07-21-dotfiles-and-navel-gazing.html",
	"/2014/07/14/assorted-vim-tip-flotsam-and-jetsam.html":              "files/2014-07-14-assorted-vim-tip-flotsam-and-jetsam.html",
	"/2014/07/07/out-of-the-tar-pit.html":                               "files/2014-07-07-out-of-the-tar-pit.html",
	"/2014/04/16/tree-walking.html":                                     "files/2014-04-16-tree-walking.html",
	"/2014/04/11/prior-art-ii.html":                                     "files/2014-04-11-prior-art-ii.html",
	"/2014/04/07/interaction-design.html":                               "files/2014-04-07-interaction-design.html",
	"/2014/04/05/prior-art.html":                                        "files/2014-04-05-prior-art.html",
	"/2014/04/04/inline-vs-global-css-in-om-layout-code.html":           "files/2014-04-04-inline-vs-global-css-in-om-layout-code.html",
	"/2014/03/26/dynabook-software.html":                                "files/2014-03-26-dynabook-software.html",
	"/2014/03/18/ants-on-tree-branches.html":                            "files/2014-03-18-ants-on-tree-branches.html",
	"/2014/02/05/calculation-vs-presentation.html":                      "files/2014-02-05-calculation-vs-presentation.html",
	"/2013/12/16/building-intuition.html":                               "files/2013-12-16-building-intuition.html",
	"/2013/12/14/vaporware.html":                                        "files/2013-12-14-vaporware.html",
	"/2013/12/14/open-source-on-apple's-app-store.html":                 "files/2013-12-14-open-source-on-apples-app-store.html",
	"/2013/12/12/recanted.html":                                         "files/2013-12-12-recanted.html",
	"/2013/12/12/it's-a-trap.html":                                      "files/2013-12-12-its-a-trap.html",
	"/2013/12/07/cobble's-knot.html":                                    "files/2013-12-07-cobbles-knot.html",
	"/2013/12/06/finals-week.html":                                      "files/2013-12-06-finals-week.html",
	"/2013/07/03/woodshed.html":                                         "files/2013-07-03-woodshed.html",
	"/2013/04/19/kolmogorov's-browser.html":                             "files/2013-04-19-kolmogorovs-browser.html",
}

func contentType(target string) string {
	switch filepath.Ext(target) {
	case ".html":
		return "text/html; charset=utf-8"
	case ".css":
		return "text/css"
	default:
		return "text/plain; charset=utf-8"
	}
}

func main() {
	println("hello world")
	var port int
	flag.IntVar(&port, "port", 8080, "port to bind to. defaults to 8080")
	flag.Parse()
	stdout := bufio.NewWriterSize(os.Stdout, 512)
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		t := time.Now()
		d, m, y := t.Date()
		fmt.Fprintf(stdout, "%s - - %d/%d/%d:%02d:%02d:%02d %s %s", r.RemoteAddr, d, m, y, t.Hour(), t.Minute(), t.Second(), r.Method, r.URL.Path)

		if target, ok := urls[r.URL.Path]; ok {
			w.Header().Add("Content-Type", contentType(target))
			f, err := embedded.Open(target)
			if err != nil {
				goto notfound
			}
			io.Copy(w, f)
			fmt.Fprintf(stdout, " 200\n")
			return
		}
	notfound:
		w.WriteHeader(404)
		fmt.Fprint(w, "Not found")
		fmt.Fprintf(stdout, " 404\n")
	})

	bindaddr := fmt.Sprintf(":%d", port)
	http.ListenAndServe(bindaddr, nil)
}
