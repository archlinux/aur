# Maintainer: Romain Gallet <romain.gallet@gmail.com>
# Contributor: Romain Gallet <romain.gallet@gmail.com>
_packager="Romain Gallet <romain.gallet@gmail.com>"
_deb_pkgname=kinesis-tailr
pkgname=kinesis-tailr-bin
md5sums=('bf6f7a44951e57c2c73edbec11818285')
pkgver=0.5.7
pkgrel=1
pkgdesc='Kinesis tail tool'
arch=('x86_64')
url="https://github.com/grumlimited/$_deb_pkgname"
license=('GPLv3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
replaces=()
backup=()
options=()
source=("$url/releases/download/$pkgver/$_deb_pkgname-$pkgver-$arch.deb")
noextract=()

build() {
	rm control.tar.zst
	tar xvf data.tar.zst
}

package() {
	cp -fr usr/ ${pkgdir}
}

