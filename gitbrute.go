/*
Copyright 2014 Google Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

// The gitbrute command brute-forces a git commit hash prefix.
package main

import (
	"bytes"
	"crypto/sha1"
	"flag"
	"fmt"
	"log"
	"os"
	"os/exec"
	"regexp"
	"runtime"
	"strconv"
	"strings"
	"time"
)

var (
	prefix = flag.String("prefix", "bf", "Desired prefix")
	force  = flag.Bool("force", false, "Re-run, even if current hash matches prefix")
	cpu    = flag.Int("cpus", runtime.NumCPU(), "Number of CPUs to use. Defaults to number of processors.")
)

var (
	start     = time.Now()
	startUnix = start.Unix()
)

func main() {
	flag.Parse()
	runtime.GOMAXPROCS(*cpu)
	if _, err := strconv.ParseInt(*prefix, 16, 64); err != nil {
		log.Fatalf("Prefix %q isn't hex.", *prefix)
	}

	hash := curHash()
	if strings.HasPrefix(hash, *prefix) && !*force {
		return
	}

	obj, err := exec.Command("git", "cat-file", "-p", hash).Output()
	if err != nil {
		log.Fatal(err)
	}
	i := bytes.Index(obj, []byte("\n\n"))
	if i < 0 {
		log.Fatalf("No \\n\\n found in %q", obj)
	}
	msg := obj[i+2:]

	possibilities := make(chan try, 512)
	go explore(possibilities)
	winner := make(chan solution)
	for i := 0; i < *cpu; i++ {
		go bruteForce(obj, winner, possibilities)
	}

	w := <-winner
	cmd := exec.Command("git", "commit", "--amend", "--date="+w.author.String(), "--file=-")
	cmd.Env = append([]string{"GIT_COMMITTER_DATE=" + w.committer.String()}, os.Environ()...)
	cmd.Stdout = os.Stdout
	cmd.Stdin = bytes.NewReader(msg)
	if err := cmd.Run(); err != nil {
		log.Fatalf("amend: %v", err)
	}
}

type solution struct {
	author, committer date
}

var (
	authorDateRx   = regexp.MustCompile(`(?m)^author.+> (.+)`)
	commiterDateRx = regexp.MustCompile(`(?m)^committer.+> (.+)`)
)

func bruteForce(obj []byte, winner chan<- solution, possibilities <-chan try) {
	// blob is the blob to mutate in-place repatedly while testing
	// whether we have a match.
	blob := []byte(fmt.Sprintf("commit %d\x00%s", len(obj), obj))
	authorDate, adatei := getDate(blob, authorDateRx)
	commitDate, cdatei := getDate(blob, commiterDateRx)

	s1 := sha1.New()
	wantHexPrefix := []byte(*prefix)
	hexBuf := make([]byte, 0, sha1.Size*2)

	for t := range possibilities {
		ad := date{startUnix - int64(t.authorBehind), authorDate.tz}
		cd := date{startUnix - int64(t.commitBehind), commitDate.tz}
		strconv.AppendInt(blob[:adatei], ad.n, 10)
		strconv.AppendInt(blob[:cdatei], cd.n, 10)
		s1.Reset()
		s1.Write(blob)
		if !bytes.HasPrefix(hexInPlace(s1.Sum(hexBuf[:0])), wantHexPrefix) {
			continue
		}
		winner <- solution{ad, cd}
		return // at least yield one goroutine's CPU for git commit to run.
	}
}

// try is a pair of seconds behind now to brute force, looking for a
// matching commit.
type try struct {
	commitBehind int
	authorBehind int
}

// explore yields the sequence:
//     (0, 0)
//
//     (0, 1)
//     (1, 0)
//     (1, 1)
//
//     (0, 2)
//     (1, 2)
//     (2, 0)
//     (2, 1)
//     (2, 2)
//
//     ...
func explore(c chan<- try) {
	for max := 0; ; max++ {
		for i := 0; i <= max-1; i++ {
			c <- try{i, max}
		}
		for j := 0; j <= max; j++ {
			c <- try{max, j}
		}
	}
}

// date is a git date.
type date struct {
	n  int64 // unix seconds
	tz string
}

func (d date) String() string { return fmt.Sprintf("%d %s", d.n, d.tz) }

// getDate parses out a date from a git header (or blob with a header
// following the size and null byte). It returns the date and index
// that the unix seconds begins at within h.
func getDate(h []byte, rx *regexp.Regexp) (d date, idx int) {
	m := rx.FindSubmatchIndex(h)
	if m == nil {
		log.Fatalf("Failed to match %s in %q", rx, h)
	}
	v := string(h[m[2]:m[3]])
	space := strings.Index(v, " ")
	if space < 0 {
		log.Fatalf("unexpected date %q", v)
	}
	n, err := strconv.ParseInt(v[:space], 10, 64)
	if err != nil {
		log.Fatalf("unexpected date %q", v)
	}
	return date{n, v[space+1:]}, m[2]
}

func curHash() string {
	all, err := exec.Command("git", "rev-parse", "HEAD").Output()
	if err != nil {
		log.Fatal(err)
	}
	h := string(all)
	if i := strings.Index(h, "\n"); i > 0 {
		h = h[:i]
	}
	return h
}

// hexInPlace takes a slice of binary data and returns the same slice with double
// its length, hex-ified in-place.
func hexInPlace(v []byte) []byte {
	const hex = "0123456789abcdef"
	h := v[:len(v)*2]
	for i := len(v) - 1; i >= 0; i-- {
		b := v[i]
		h[i*2+0] = hex[b>>4]
		h[i*2+1] = hex[b&0xf]
	}
	return h
}
