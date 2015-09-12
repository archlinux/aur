# Maintainer: Keith Henderson Jr
# Contributer: Robert Mackanics <schnoopay@gmx.com>

pkgname="libreoffice-still-en-us-help"
pkgver=4.4.5
pkgrel=1
pkgdesc="en-US offline help for Libreoffice Still"
arch=('any')
url="http://www.documentfoundation.org"
license=('LGPL')
makedepends=('rpmextract')
conflicts=('libreoffice-en-us-help')
source=("http://download.documentfoundation.org/libreoffice/stable/${pkgver}/rpm/x86/LibreOffice_4.4.5_Linux_x86_rpm_helppack_en-US.tar.gz")
prepare() {
rpmextract.sh ${srcdir}/LibreOffice_$pkgver*_Linux_x86_rpm_helppack_en-US/RPMS/*.rpm
}

package() {
  mkdir -p "$pkgdir"/usr/lib/libreoffice/
  cp -R opt/libreoffice*/* "$pkgdir"/usr/lib/libreoffice

}
md5sums=('6493312bcc30c764e13251515a16d49c')
