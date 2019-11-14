//
// go run update.go
//
package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"os/exec"
	"strings"
	"text/template"
)

const (
	manifestURL = "http://packages.chef.io/files/stable/habitat/latest/manifest.json"
	sha256URL   = "https://packages.chef.io/files/stable/habitat/latest/hab-x86_64-linux.tar.gz.sha256sum"
	pkgbuildTmp = `# Maintainer: Ryan Cragun <me@ryan.ec>
# http://packages.chef.io/files/stable/habitat/latest/manifest.json
pkgname=habitat-bin
pkgver={{.Version}}
_pkgrelease={{.Release}}
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
provides=('habitat')
conflicts=('habitat' 'habitat-git')
source=("https://packages.chef.io/files/habitat/${pkgver}/hab-${arch}-linux.tar.gz")
sha256sums=('{{.SHA256}}')
package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_pkgrelease}-${arch}-linux/hab" "${pkgdir}/usr/bin/hab"
}
`
)

// habManifest is a partial representation of the hab package manifest containing
// only the bits we care about.
type habManifest struct {
	Version  string              `json:"version"`
	Packages map[string][]string `json:"packages"`
}

// pkgbuild is the struct we'll pass into the PKGBUILD template
type pkgbuild struct {
	Version string
	Release string
	SHA256  string
}

func main() {
	res, err := http.Get(manifestURL)
	if err != nil {
		fmt.Printf("%v", err)
		os.Exit(1)
	}
	defer res.Body.Close()

	body, err := ioutil.ReadAll(res.Body)
	if err != nil {
		fmt.Printf("%v", err)
		os.Exit(1)
	}

	manifest := &habManifest{}
	err = json.Unmarshal(body, manifest)
	if err != nil {
		fmt.Printf("%v", err)
		os.Exit(1)
	}

	_, ok := manifest.Packages["x86_64-linux"]
	if !ok {
		fmt.Println("release manifest doesn't have x86_64 packages")
		os.Exit(1)
	}

	release := ""
	for _, p := range manifest.Packages["x86_64-linux"] {
		parts := strings.Split(p, "/")
		if parts[1] == "hab" {
			release = parts[3]
			break
		}
	}

	if release == "" {
		fmt.Println("unable to determine hab build release")
		os.Exit(1)
	}

	res, err = http.Get(sha256URL)
	if err != nil {
		fmt.Printf("%v", err)
		os.Exit(1)
	}
	defer res.Body.Close()

	body, err = ioutil.ReadAll(res.Body)
	if err != nil {
		fmt.Printf("%v", err)
		os.Exit(1)
	}

	sha256 := strings.Split(string(body), " ")[0]

	pkgbuild := &pkgbuild{
		Version: manifest.Version,
		Release: release,
		SHA256:  sha256,
	}

	f, err := os.Create("PKGBUILD")
	if err != nil {
		fmt.Printf("%v", err)
		os.Exit(1)
	}

	temp, err := template.New("PKGBUILD").Parse(pkgbuildTmp)
	if err != nil {
		fmt.Printf("%v", err)
		os.Exit(1)
	}

	err = temp.Execute(f, pkgbuild)
	if err != nil {
		fmt.Printf("%v", err)
		os.Exit(1)
	}

	out, err := exec.Command("makepkg", "--printsrcinfo").Output()
	if err != nil {
		fmt.Printf("%v", err)
		os.Exit(1)
	}

	err = ioutil.WriteFile(".SRCINFO", out, 0666)
	if err != nil {
		fmt.Printf("%v", err)
		os.Exit(1)
	}

	os.Exit(0)
}
