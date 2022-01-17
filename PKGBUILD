# Maintainer: wostarxi <wostarxi@outlook.com>
pkgname=hugo-extended-bin
pkgver=0.92.0
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
source=("https://github.com/gohugoio/hugo/releases/download/v${pkgver}/hugo_extended_${pkgver}_Linux-64bit.deb")
sha256sums=("99b49ab93b6a337d872affbeb257ed63a80735a3cc26f85e8eb282a23103185d")

package() {
	cd $srcdir
        tar -xvf data.tar.gz
        install -Dm755 $srcdir/usr/local/bin/hugo $pkgdir/usr/bin/hugo
}
