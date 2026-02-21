pkgname=efisc2025-bin
pkgver=1.0.4
pkgrel=73
pkgdesc="Beschreibung des Programms"
arch=('x86_64')
url="https://steuerverwaltung.tg.ch/hilfsmittel/efisc-steuererklaerungssoftware/download-efisc2025.html/17525"
license=('custom')
depends=('hicolor-icon-theme' 'xdg-utils')
provides=('efisc2025')
conflicts=('efisc2025')
# Maintainer: stpaulifan <stpaulifan.y441j@simplelogin.com>

source=("https://efisc.kttg.ch/update/eFisc/2025/efisc2025_1.0.4-73_amd64.deb")
sha256sums=('SKIP')

package() {
  # .deb ist ein ar-Archiv → data.tar extrahieren
  bsdtar -xf "$srcdir/efisc2025_1.0.4-73_amd64.deb"
  
  # data.tar.* extrahieren
  bsdtar -xf data.tar.* -C "$pkgdir"
}
