# Maintainer: utsi
pkgname=qtcreator-cppcheck-plugin
pkgver=4.1.0
pkgrel=1
pkgdesc="Qt Creator Cppcheck integration plugin"
groups=('qt' 'qt5')
arch=('x86_64')
provides=('qtcreator-cppcheck-plugin')
conflicts=()
license=('MIT')
url="http://downloads.sourceforge.net/project/qtc-cppcheck/bin/${pkgver}/"
depends=('qtcreator>=4.1.0' 'qtcreator<4.2.0' 'cppcheck')
makedepends=()
source=("${url}/QtcCppcheck-${pkgver}-linux-x64.tar.gz")
sha512sums=('fcdb03fac498d81902dc4624086657665cb6c7139aea2e3bafe3f500f13ac593cae87be347933bff914dfb5058f683a99bc547b145471cf43a1e0d26cc4ec7d2')


package() {
    mkdir "${pkgdir}"/usr/
    cp -r "${srcdir}"/lib/   "${pkgdir}"/usr/
    cp -r "${srcdir}"/share/ "${pkgdir}"/usr/
}


