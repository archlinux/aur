# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
pkgname=libreoffice-extension-orthos-greek-thesaurus
pkgver=0.4.0
pkgrel=1
pkgdesc='Greek thesaurus for Libreoffice by the Orthos project'
arch=('any')
url='https://sourceforge.net/projects/orthos-spell/'
license=('BSD')
depends=('libreoffice')
groups=('libreoffice-extensions')
conflicts=('mythes-el')
makedepends=('unzip')
source=('https://sourceforge.net/projects/orthos-spell/files/v.0.4.0./orthos-thesaurus-0.4.0-87.oxt')
sha256sums=('e0f3d4614ce527304a920a7a4a24b3ede033e288785d2b36113d0d3646bee521')

package() {
  install -dm755 ${pkgdir}/usr/lib/libreoffice/share/extensions
  unzip -q ${srcdir}/orthos-thesaurus-0.4.0-87.oxt -d ${pkgdir}/usr/lib/libreoffice/share/extensions/orthos-thesaurus
}

