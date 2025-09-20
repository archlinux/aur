# Maintainer: Romain Gallet <romain.gallet@gmail.com>
# Contributor: Romain Gallet <gr211 at users.noreply.github.com>
_packager="Romain Gallet <gr211 at users.noreply.github.com>"
_deb_pkgname=kinesis-tailr
pkgname=kinesis-tailr-bin
md5sums=('ee26019d273c3ee9723ef4a5e506915f')
pkgver=0.6.6
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

