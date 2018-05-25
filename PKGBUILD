# Maintainer: Skywol <Skywol@qq.com>
pkgname=deepin.com.qq.eim
pkgver=1.98deepin3
pkgrel=1
epoch=
pkgdesc="Deepin Wine QQEIM 1.98"
arch=('i686' 'x86_64')
url="http://b.qq.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/Skywol/deepin-wine-eim/archive/$pkgver.tar.gz")
md5sums=('77603906689003d8d464bae8a3361857')
validpgpkeys=()

prepare() {
	mkdir ${pkgname}-${pkgver}
	cp -r deepin-wine-eim-$pkgver/* $pkgname-$pkgver
}

package() {
	cd "${pkgname}-${pkgver}"
	cp -r ./ ${pkgdir}/
}
