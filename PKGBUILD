# Maintainer: Lynx Li <lyxswo@outlook.com>
pkgname=hugo-extended-bin
pkgver=0.100.2
pkgrel=1
epoch=
pkgdesc="hugo entended version"
arch=("x86_64")
url="https://gohugo.io"
license=('Apache-2.0')
conflicts=("hugo")
source=("https://github.com/gohugoio/hugo/releases/download/v${pkgver}/hugo_extended_${pkgver}_Linux-64bit.deb")
sha256sums=("SKIP")

package() {
	cd $srcdir
        tar -xvf data.tar.gz
        install -Dm755 $srcdir/usr/local/bin/hugo $pkgdir/usr/bin/hugo
}
