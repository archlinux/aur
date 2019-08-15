# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname="cucumber"
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="CLI note taking app"
arch=("any")
url="https://gitlab.com/oktopod11/cucumber"
license=("GPL3")
groups=()
depends=("bash" "sed" "less")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://gitlab.com/oktopod11/$pkgname/raw/master/archive/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=("602ef5bb0d8b38a5ff2b7d4aed467ebf42c7c25968bf9f70e87eac70408871c0") 

package() {
	mkdir -vp "$pkgdir/usr/bin/"
	cp -v "$srcdir/$pkgname/cucumber.sh" "$pkgdir/usr/bin/cucumber"
}
