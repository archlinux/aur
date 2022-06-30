# Maintainer: foobat <scratcher@foxmail.com>
pkgname=fcitx5-breeze
pkgver=2.0.0
pkgrel=1
pkgdesc="Fcitx5 theme to match KDE's Breeze style."
arch=('any')
url="https://github.com/scratch-er/fcitx5-breeze"
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/scratch-er/fcitx5-breeze/releases/download/v${pkgver}/fcitx5-breeze-prebuilt-${pkgver}.tar.gz")
md5sums=('0a800fc71c1906dc88cdb907ac0af01c')

package() {
	cd $pkgname
	./install.sh "${pkgdir}/usr"
}
