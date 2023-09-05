package main

import (
	"fmt"
	"os"
	"os/exec"
	"strconv"
)

var template = `# Maintainer: Equationzhao <equationzhao at foxmail dot com>
pkgname='g-ls'
pkgver=%s
pkgrel=%d
pkgdesc='a powerful ls in golang'
arch=($CARCH)
url='https://github.com/Equationzhao/g'
license=('MIT')
makedepends=('go')
backup=("etc/$pkgname/config.conf")
source=("g-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6d39469e541eec15fcad38301faf8879a84e0566dde156e3d6d582541036135f')


build() {
    cd "$srcdir/g-$pkgver"
    go build -ldflags="-s -w" -o g
}

package() {
    cd "$srcdir/g-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    install -m755 g "$pkgdir/usr/bin"
    cd man
    install -Dm644 g.1.gz "$pkgdir/usr/share/man/man1/g.1.gz"
}
`

var (
	v   = ""
	rel = 1
)

func main() {
	switch len(os.Args) {
	case 0:
	case 1:
		println("plz specify version")
		return
	case 2:
		v = os.Args[1]
	case 3:
		v = os.Args[1]
		var err error
		rel, err = strconv.Atoi(os.Args[2])
		if err != nil {
			println("rel must be int")
			return
		}
	default:
		println("what hell are you doing?")
		return
	}

	content := fmt.Sprintf(template, v, rel)
	err := exec.Command("rm", "-rf", "PKGBUILD").Run()
	if err != nil {
		println(err.Error())
		return
	}
	pkg, _ := os.OpenFile("PKGBUILD", os.O_CREATE|os.O_WRONLY, 0o644)
	_, err = pkg.Write([]byte(content))
	if err != nil {
		println(err.Error())
		return
	}
	result, err := exec.Command("bash", "make.sh").Output()
	if err != nil {
		println(err.Error())
		return
	}
	println(string(result))
}
