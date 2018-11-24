# Current Maintainer: necklace <ns@nsz.no>
# Original Packager: sunnaryt <joshd@protonmail.com>
# Contributors: Det, t3ddy, Lex Rivera aka x-demon, ruario

pkgname=iridium-deb
pkgver=71.0
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

source=("https://downloads.iridiumbrowser.de/ubuntu/iridium-browser_current_amd64.deb"
)

sha256sums=('4ec07d3844b64068dd7a062fa3f84629956ae65faa831533fa42aff60b5e4029')
sha384sums=('752d46940f929e856b3902ab90cc13738e7e8fa405b9363767556e6346b78607dbeade5bc42ccab15a0eb099e9629ef8')
sha512sums=('cc1f9e742f24ae7afba7b144d72cd45b23392033676ed6fc8e5a522e0cee81598cbc5e54aca5f7ecfd3a9c2bc377c0e7acf48c48d8258f883bfc3a77adbf9376')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
