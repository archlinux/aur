# Maintainer: necklace <ns@nsz.no>
# Contributor: sunnaryt <joshd@protonmail.com>

pkgname=iridium-deb
pkgver=73.0
pkgrel=2
pkgdesc="An attempt at creating a safer, faster, and more stable browser (Stable Channel)"
arch=('x86_64')
url="https://iridiumbrowser.de/"
license=('BSD')
depends=('alsa-lib' 'desktop-file-utils' 'flac' 'gconf' 'gnome-themes-standard' 'gtk2' 'harfbuzz' 'harfbuzz-icu'
         'hicolor-icon-theme' 'icu' 'libpng' 'libxss' 'libxtst' 'nss' 'opus' 'snappy' 'speech-dispatcher'
         'ttf-font' 'xdg-utils')
optdepends=('kdialog: needed for file dialogs in KDE'
            'ttf-liberation: fix fonts for some PDFs')
options=('!emptydirs' '!strip')
provides=('iridium')
conflicts=('iridium')
source=("https://downloads.iridiumbrowser.de/deb/pool/main/i/iridium-browser/iridium-browser_2019.04.73-1iridium0_amd64.deb")

sha256sums=('12c64bec477ffe5b998994bcd7f1078abff3691edc1c25cd4792e0e59b78ba90')
sha384sums=('98cdea200f178ed07350c237a3a05000c28ecded57a1f26616d2b4f730c233d4385bb12f803e4643304d238851f4de32')
sha512sums=('06bc14849058059846ca29bd7d7b0e6e07623e4618900c134939b3c294fe98182f4ecc6ff6f9b6f6d2b40d02e2419d1fc93f1700131d172124ad57c2d69b43d8')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
