pkgname=efisc2024-bin
pkgver=.0.10
pkgrel=69
pkgdesc="Beschreibung des Programms"
arch=('x86_64')
url="https://steuerverwaltung.tg.ch/hilfsmittel/efisc-steuererklaerungssoftware/download-efisc2024.html/16453"
license=('custom')
depends=('hicolor-icon-theme' 'xdg-utils')
provides=('efisc2024')
conflicts=('efisc2024')
# Maintainer: stpaulifan <stpaulifan.y441j@simplelogin.com>

source=("https://efisc.kttg.ch/update/eFisc/2024/efisc2024_1.0.10-69_amd64.deb")
sha256sums=('SKIP')

package() {
  # .deb ist ein ar-Archiv → data.tar extrahieren
  bsdtar -xf "$srcdir/efisc2024_1.0.10-69_amd64.deb"
  
  # data.tar.* extrahieren
  bsdtar -xf data.tar.* -C "$pkgdir"
}
