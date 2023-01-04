# Maintainer: Huck Boles <huck@huck.website>
# shellcheck disable=all

pkgname=odot
pkgver=0.2.1
pkgrel=1
pkgdesc="Command line task manager with groups."
arch=('any')
url="https://download.huck.website"
license=('GPL')
groups=()
depends=()
makedepends=('gcc')
checkdepends=()
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::$url/$pkgname-$pkgver.tar.gz.sig")
validpgpkeys=('79C7FF1705F4BD138A40F09454437D8EAEF8818C')

sha256sums=('3d1caa929f32c0f17104e8dfc308166acd157f216ed6c46fc8e9a8e5093b1894' 'SKIP')

package() {
	make install
}
