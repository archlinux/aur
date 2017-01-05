# Maintainer: Det <nimetonmaili g-mail>
# Contributors: t3ddy, Lex Rivera aka x-demon, ruario


pkgname=iridium-bin
pkgver=54.0
pkgrel=1
pkgdesc="An attempt at creating a safer, faster, and more stable browser (Stable Channel)"
arch=('x86_64')
url="iridiumrowser.de"
license=('GPL3')
depends=('alsa-lib' 'desktop-file-utils' 'flac' 'gconf' 'gnome-themes-standard' 'gtk2' 'harfbuzz' 'harfbuzz-icu'
         'hicolor-icon-theme' 'icu' 'libpng' 'libxss' 'libxtst' 'nss' 'opus' 'snappy' 'speech-dispatcher'
         'ttf-font' 'xdg-utils')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'ttf-liberation: fix fonts for some PDFs')
options=('!emptydirs' '!strip')

source=("https://downloads.iridiumbrowser.de/ubuntu/iridium-browser_current_amd64.deb"
)
sha256sums=('fc241c0deda42e98d4e10bd5d194255b6887ecf680d5f7d83c0e13d3212a2246')
sha384sums=('40128dd662535e7465498e452591e9b8e1fd40529cb05e08c20d100b96218349ca8344844cf94b307366180ba68accaa')
sha512sums=('c34404d4bc9a754d7bb9212c2bc59921054c5538f6835b371e1969a690c06243b3ba804e8c1d0eed3d2f10622620129d08e945283430b24f2282c486d6f3c961')


package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  
 
}
