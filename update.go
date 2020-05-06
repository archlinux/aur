/*
Copyright Ryan Cragun

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

//
// go run update.go to update the PKGBUILD and .SRCINFO with the latest hab
//
package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"os/exec"
	"text/template"
)

const (
	manifestURL = "http://packages.chef.io/files/stable/habitat/latest/manifest.json"
	pkgbuildTmp = `# Maintainer: Ryan Cragun <me@ryan.ec>
# http://packages.chef.io/files/stable/habitat/latest/manifest.json
pkgname=habitat
pkgver={{.Version}}
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
depends=('libarchive' 'libsodium' 'openssl')
makedepends=('git' 'cargo' 'zeromq')
provides=('habitat')
conflicts=('habitat-bin' 'habitat-git')
source=("${pkgname}::git+https://github.com/habitat-sh/habitat.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  # Use a temporary local Cargo repository.
  export CARGO_HOME="${srcdir}/cargo-repository"

  cd "${srcdir}/${pkgname}"
  make
}

package() {
  install -D -m755 "${srcdir}/${pkgname}/target/debug/hab" "${pkgdir}/usr/bin/hab"
}
`
)

// habManifest is a partial representation of the hab package manifest containing
// only the bits we care about.
type habManifest struct {
	Version string `json:"version"`
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

	err = temp.Execute(f, manifest)
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
