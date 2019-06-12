# Maintainer: Katie Wolfe <katie@dnaf.moe>
pkgname=blush
pkgver=0.5.3
pkgrel=1
pkgdesc='Grep with colours'
arch=('x86_64')
url='https://github.com/arsham/blush'
license=('MIT')
depends=()
provides=('blush')
conflicts=('blush')
source=("https://github.com/arsham/blush/releases/download/v${pkgver}/blush_linux_v${pkgver}.tar.gz")
sha256sums=('48a6af626b94e98a3de13b28cf1b0210b9f78b913a79df6e3013bc59019447d5')

package() {
	install -Dm755 "${srcdir}/blush" "${pkgdir}/usr/bin/blush"
}
