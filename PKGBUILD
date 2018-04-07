# Current Maintainer: necklace <ns@nsz.no>
# Original Packager: sunnaryt <joshd@protonmail.com>
# Contributors: Det, t3ddy, Lex Rivera aka x-demon, ruario

pkgname=iridium-deb
pkgver=61.0
pkgrel=1
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

source=("https://downloads.iridiumbrowser.de/ubuntu/iridium-browser_current_amd64.deb"
)

sha256sums=('a5c00da23c4fd86e3a85dcfbc158338c056aca1a0e0da722bd4dc3544d4387fe')
sha384sums=('9a9c49a0a1ea38351310cb10ce68eccbfff12ded5cbf9a947bdc9ca9803b0368266f43967dd48d83f2efb88ace252542')
sha512sums=('51933bd4d6ef0054246358c36554dcf98711ec3e770560d76b847ee081eef478e416118278a1e818d66839eaf0a5f71405c2dfc7f250ee85677eae14b20421d7')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
