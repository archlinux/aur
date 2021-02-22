# Maintainer: foobat <scratcher@foxmail.com>
pkgname=fcitx5-breeze
pkgver=1.0.0
pkgrel=1
pkgdesc="Fcitx5 theme to match KDE's Breeze style."
arch=('any')
url="https://github.com/scratch-er/fcitx5-breeze"
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/scratch-er/fcitx5-breeze/archive/v${pkgver}.tar.gz")
md5sums=('9773398a02162cd8400db0287d9912bd')

package() {
	cd "$pkgname-$pkgver"
	./install.sh "${pkgdir}/usr"
}
