package main

import (
	"fmt"
	"log"
	"net/http"
	"sync"
)

const (
	port = ":1234"
)

var calls = 0
var mutex = &sync.Mutex{}

func helloWorld(w http.ResponseWriter, r *http.Request) {
	mutex.Lock()
	calls++
	mutex.Unlock()
	log.Printf("request from %v\ncalls: %d\n", r.RemoteAddr, calls)
	w.Write([]byte("howdy\n"))
}

func books(w http.ResponseWriter, r *http.Request) {
	mutex.Lock()
	calls++
	mutex.Unlock()
	log.Printf("request from %v\ncalls: %d\n", r.RemoteAddr, calls)

	magazinPages := map[string]int{
		"vogue":     130,
		"natgeo":    78,
		"newyorker": 132,
	}

	magazine := r.URL.Path[len("/magazine/"):]
	pages := magazinPages[magazine]

	if len(magazine) > 0 {
		fmt.Fprintf(w, "%s has %d pages.\n", magazine, pages)
	} else {
		fmt.Fprintf(w, "No magazine provided.\n")
	}
}

func main() {
	http.HandleFunc("/", helloWorld)
	http.HandleFunc("/magazine/", books)
	log.Printf("Server at http://localhost%v.\n", port)
	log.Fatal(http.ListenAndServe(port, nil))
}
