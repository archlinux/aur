# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
pkgname=libreoffice-extension-orthos-greek-dictionary
pkgver=0.4.0
pkgrel=1
pkgdesc='Greek dictionary for Libreoffice by the Orthos project'
arch=('any')
url='https://sourceforge.net/projects/orthos-spell/'
license=('BSD')
depends=('libreoffice')
groups=('libreoffice-extensions')
conflicts=('libreoffice-extension-orthos-greek-english-dictionary' 'libreoffice-extension-orthos-greek-cypriot-dictionary')
makedepends=('unzip')
source=('https://sourceforge.net/projects/orthos-spell/files/v.0.4.0./orthos-el_GR-0.4.0-87.oxt')
sha256sums=('541328be3043d861361fd8d79874ac8d4cd042b657bbd9ba94a5dafab9cbae2d')

package() {
  install -dm755 ${pkgdir}/usr/lib/libreoffice/share/extensions
  unzip -q ${srcdir}/orthos-el_GR-0.4.0-87.oxt -d ${pkgdir}/usr/lib/libreoffice/share/extensions/orthos-el_GR
}

