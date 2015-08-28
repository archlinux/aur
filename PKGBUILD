# Maintainer: utsi
pkgname=qtcreator-cppcheck-plugin
pkgver=3.5.0
pkgrel=1
pkgdesc="Qt Creator Cppcheck integration plugin"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
provides=('qtcreator-cppcheck-plugin')
conflicts=()
license=('MIT')
url="http://downloads.sourceforge.net/project/qtc-cppcheck/"
depends=('qtcreator=3.5.0' 'cppcheck')
makedepends=()
if [ "$CARCH" == x86_64 ]; then
	source=("${url}/bin/QtcCppcheck-${pkgver}-linux-x64.tar.gz")
	sha1sums=('c37666f987487073d3c0887d9c146b49a53fea1e')
elif [ "$CARCH" == i686 ]; then
	source=("${url}/bin/QtcCppcheck-${pkgver}-linux-x86.tar.gz")
	sha1sums=('c6f7d6e328413d93dbfce33ee527ca59f7346b82')
fi


package() {
    mkdir "${pkgdir}"/usr/
    cp -r "${srcdir}"/lib/   "${pkgdir}"/usr/
    cp -r "${srcdir}"/share/ "${pkgdir}"/usr/
}


