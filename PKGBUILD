# Maintainer: utsi
pkgname=qtcreator-cppcheck-plugin
pkgver=3.6.0
pkgrel=1
pkgdesc="Qt Creator Cppcheck integration plugin"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
provides=('qtcreator-cppcheck-plugin')
conflicts=()
license=('MIT')
url="http://downloads.sourceforge.net/project/qtc-cppcheck/bin/${pkgver}/"
depends=('qtcreator=3.6.0' 'cppcheck')
makedepends=()
if [ "$CARCH" == x86_64 ]; then
	source=("${url}/QtcCppcheck-${pkgver}-linux-x64.tar.gz")
	sha1sums=('62a2a39623ed0bb992605950d33c5f61783108c5')
elif [ "$CARCH" == i686 ]; then
	source=("${url}/QtcCppcheck-${pkgver}-linux-x86.tar.gz")
	sha1sums=('5d92a993a365fbc6b2d651d13b776a6e8959c890')
fi


package() {
    mkdir "${pkgdir}"/usr/
    cp -r "${srcdir}"/lib/   "${pkgdir}"/usr/
    cp -r "${srcdir}"/share/ "${pkgdir}"/usr/
}


