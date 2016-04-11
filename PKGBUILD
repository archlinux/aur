# Maintainer: Timothée Ravier <tim@siosm.fr>
# Contributor: Blake Imsland <blake@retroco.de>

pkgname=uchardet
pkgver=0.0.5
pkgrel=2
pkgdesc='Encoding detector library ported from Mozilla'
arch=('i686' 'x86_64')
url='https://github.com/BYVoid/uchardet'
license=('MPL')
makedepends=('cmake')
depends=('gcc-libs')
source=("https://github.com/BYVoid/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
	cd ${pkgname}-${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}/" install
}

sha256sums=('7c5569c8ee1a129959347f5340655897e6a8f81ec3344de0012a243f868eabd1')
sha384sums=('c8b4af6cfad7231969aa27622a14374ad1f6d68d1d3210d4c563a0727e4ca5dff47a027a48a91fc71d2adcd8c6c4d2ec')
sha512sums=('e32ff3e7baa9804199e3ca240ce590fed3fcb539fe4d780c4ec205fa5cbd45415e2c8c8db51d97965f9f9bbaad1f34613d5ed2849aafd9bbc3dda850c0be20ac')
