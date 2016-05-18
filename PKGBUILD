# Maintainer: utsi
pkgname=qtcreator-cppcheck-plugin
pkgver=4.0.0
pkgrel=1
pkgdesc="Qt Creator Cppcheck integration plugin"
groups=('qt' 'qt5')
arch=('x86_64')
provides=('qtcreator-cppcheck-plugin')
conflicts=()
license=('MIT')
url="http://downloads.sourceforge.net/project/qtc-cppcheck/bin/${pkgver}/"
depends=('qtcreator>=4.0.0' 'qtcreator<4.1.0' 'cppcheck')
makedepends=()
source=("${url}/QtcCppcheck-${pkgver}-linux-x64.tar.gz")
sha512sums=('f75415a20f551bb693d27ba1efb11b0780013ae6040c625e11534e4118f834bfe4bf3d9cf265dcce1a990e4696b8ac5a99c84f503f59922df9a3214f4e7717f3')


package() {
    mkdir "${pkgdir}"/usr/
    cp -r "${srcdir}"/lib/   "${pkgdir}"/usr/
    cp -r "${srcdir}"/share/ "${pkgdir}"/usr/
}


