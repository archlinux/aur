#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=getmu
pkgver=1.4.5
pkgrel=2
pkgdesc="A full-stack DevOps on AWS framework"
arch=('x86_64')
source=("https://github.com/stelligent/mu/releases/download/v$pkgver/mu-linux-amd64")
url="https://github.com/stelligent/mu"
license=("MIT")
md5sums=("2f31cb41df1c3e1f1a65bd47c5a2f19d")

package() {
  cd "$srcdir"
  chmod +x "mu-linux-amd64"
  install -Dm755 "mu-linux-amd64" "$pkgdir/usr/bin/mu"
}
