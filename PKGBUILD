# Maintainer: wostarxi <wostarxi@outlook.com>
pkgname=hugo-extended-bin
pkgver=0.91.2
pkgrel=1
epoch=
pkgdesc="hugo entended version"
arch=("x86_64")
url="https://gohugo.io"
license=('Apache-2.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=("hugo")
replaces=()
backup=()
options=()
install=
source=("https://github.com/gohugoio/hugo/releases/download/v0.91.2/hugo_extended_0.91.2_Linux-64bit.deb")
sha256sums=("a7480201ec1e32f7fc0c0346234fa8f80cea9b9945a33809e984addd1ef322fb")

package() {
	cd $srcdir
        tar -xvf data.tar.gz
        install -Dm755 $srcdir/usr/local/bin/hugo $pkgdir/usr/bin/hugo
}
