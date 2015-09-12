# Maintainer: Keith Henderson Jr
# Contributer: Robert Mackanics <schnoopay@gmx.com>

pkgname="libreoffice-fresh-en-us-help"
pkgver=5.0.1
pkgrel=1
pkgdesc="en-US offline help for Libreoffice Fresh"
arch=('any')
url="http://www.documentfoundation.org"
license=('LGPL')
makedepends=('rpmextract')
conflicts=('libreoffice-en-us-help')
source=("http://download.documentfoundation.org/libreoffice/stable/${pkgver}/rpm/x86/LibreOffice_5.0.1_Linux_x86_rpm_helppack_en-US.tar.gz")
prepare() {
rpmextract.sh ${srcdir}/LibreOffice_$pkgver*_Linux_x86_rpm_helppack_en-US/RPMS/*.rpm
}

package() {
  mkdir -p "$pkgdir"/usr/lib/libreoffice/
  cp -R opt/libreoffice*/* "$pkgdir"/usr/lib/libreoffice

}
md5sums=('7cc6a019587a4f9de3ac51f48e3c318d')
