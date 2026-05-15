# Maintainer: Rio <dateshidze.gio@gmail.com>
pkgname=emojify-bin
pkgver=1.2.5
pkgrel=1
pkgdesc="An emoji picker made to be fast. (GTK4/C++)"
arch=('x86_64')
url="https://github.com/RioTheDev/emojify"
license=('GPL3')
depends=('gtkmm-4.0' 'glibmm-2.68' 'libadwaita')
provides=('emojify')
conflicts=('emojify')

source_x86_64=("${url}/releases/download/v${pkgver}/emojify-x86_64.tar.gz")

sha256sums_x86_64=('02a3de31dccb3e15bbcd5fc2ff869e8aebf988f6e5c0d5e743d8c5d588690175')
	
package() {
  cp -rv "${srcdir}/usr" "${pkgdir}/"
}
