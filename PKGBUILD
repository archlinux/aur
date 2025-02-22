# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname="libreoffice-extension-orthos-greek-cypriot-dictionary"
pkgver="0.4.0"
pkgrel="2"
epoch="1"
pkgdesc="Greek and Cypriot dialect dictionary bundle for Libreoffice by the Orthos project"
arch=("any")
url="https://sourceforge.net/projects/orthos-spell/"
license=("BSD")
depends=("libreoffice")
groups=("libreoffice-extensions")
conflicts=("libreoffice-extension-orthos-greek-dictionary" "libreoffice-extension-orthos-greek-english-dictionary")
makedepends=("unzip")
source=("https://sourceforge.net/projects/orthos-spell/files/v.0.4.0./orthos-el_GR-el_CY-0.4.0-87.oxt")
sha256sums=("6854544731359770961f6d0f5b4313793185ff16cc99dce125c66a44c66bb96b")

package() {
  install -dm755 "${pkgdir}/usr/lib/libreoffice/share/extensions"
  unzip -q "${srcdir}/orthos-el_GR-el_CY-0.4.0-87.oxt" -d "${pkgdir}/usr/lib/libreoffice/share/extensions/orthos-el_GR-el_CY"
}

