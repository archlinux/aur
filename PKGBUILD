# Maintainer: utsi
pkgname=qtcreator-cppcheck-plugin
pkgver=4.3.0
pkgrel=1
pkgdesc="Qt Creator Cppcheck integration plugin"
groups=('qt' 'qt5')
arch=('x86_64')
provides=('qtcreator-cppcheck-plugin')
conflicts=()
license=('MIT')
url="http://downloads.sourceforge.net/project/qtc-cppcheck/bin/${pkgver}/"
depends=('qtcreator<4.4.0' 'cppcheck')
makedepends=()
source=("${url}/QtcCppcheck-${pkgver}-linux-x64.tar.gz")
sha512sums=('5077a093b5c82ce55f5d5eb755413cfa366fdafdd027ba461b00eef72b463b96beac1eb935edae44c50c0b026772dfd0b64c3731613deb14e3891b872ac401b6')


package() {
    mkdir "${pkgdir}"/usr/
    cp -r "${srcdir}"/lib/   "${pkgdir}"/usr/
    cp -r "${srcdir}"/share/ "${pkgdir}"/usr/
}


