# Maintainer: utsi
pkgname=qtcreator-cppcheck-plugin
pkgver=4.2.0
pkgrel=2
pkgdesc="Qt Creator Cppcheck integration plugin"
groups=('qt' 'qt5')
arch=('x86_64')
provides=('qtcreator-cppcheck-plugin')
conflicts=()
license=('MIT')
url="http://downloads.sourceforge.net/project/qtc-cppcheck/bin/${pkgver}/"
depends=('qtcreator<4.3.0' 'cppcheck')
makedepends=()
source=("${url}/QtcCppcheck-${pkgver}-linux-x64.tar.gz")
sha512sums=('c8907eb5b6380f75b793dfa9541dd168a6bd914eff3ec5624c7c0a1d434dc8a6a09b4904e925446df089e2eaca4757f66f5db17ea8bbb0cf6dcb0737da7b90f5')


package() {
    mkdir "${pkgdir}"/usr/
    cp -r "${srcdir}"/lib/   "${pkgdir}"/usr/
    cp -r "${srcdir}"/share/ "${pkgdir}"/usr/
}


