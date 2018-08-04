#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=getmu
pkgver=1.4.6
pkgrel=1
pkgdesc="A full-stack DevOps on AWS framework"
arch=('x86_64')
source=("https://github.com/stelligent/mu/releases/download/v$pkgver/mu-linux-amd64")
url="https://github.com/stelligent/mu"
license=("MIT")
md5sums=("e3cbc51552e5a238c5436e235a3cbec1")

package() {
  cd "$srcdir"
  chmod +x "mu-linux-amd64"
  install -Dm755 "mu-linux-amd64" "$pkgdir/usr/bin/mu"
}
