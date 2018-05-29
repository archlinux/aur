# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
pkgname=libreoffice-extension-orthos-greek-english-dictionary
pkgver=0.4.0
pkgrel=1
pkgdesc='Greek and English dictionary bundle for Libreoffice by the Orthos project'
arch=('any')
url='https://sourceforge.net/projects/orthos-spell/'
license=('BSD')
depends=('libreoffice')
groups=('libreoffice-extensions')
conflicts=('libreoffice-extension-orthos-greek-dictionary' 'libreoffice-extension-orthos-greek-cypriot-dictionary')
makedepends=('unzip')
source=('https://sourceforge.net/projects/orthos-spell/files/v.0.4.0./orthos-el_GR-en_US-0.4.0-87.oxt')
sha256sums=('2402e8f82759e9c63c4a4f2844dfb2c6f25c1b76f8efab16825652e1c7802f1b')

package() {
  install -dm755 ${pkgdir}/usr/lib/libreoffice/share/extensions
  unzip -q ${srcdir}/orthos-el_GR-en_US-0.4.0-87.oxt -d ${pkgdir}/usr/lib/libreoffice/share/extensions/orthos-el_GR-en_US
}

