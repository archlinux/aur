#Maintainer:7k5x<7k5xlp0onfire@gmail.com>
pkgname='libnimf'
pkgver=1.3.0
pkgrel=1
pkgdesc="Input Method Framework (shared library). Nimf is a lightweight, fast and extensible input method framework. This package contains the shared library."
arch=('x86_64')
depends=('glib2>=2.54' 'glibc>=2.4')
source=('https://github.com/hamonikr/nimf/releases/download/1.3.0/libnimf1_1.3.0hamonikr40.4_amd64.deb')
sha256sums=('78ed3fd5a2e5cffbff882322c70a2d1cc2f36c316c2df6242bea6d40803c0c72')
url="https://github.com/hamonikr/nimf"
license=("LGPL3")
package() {
	bsdtar -xf ${srcdir}/data.tar.xz -C "${pkgdir}/"
}
