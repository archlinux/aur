# Maintainer: sunnaryt <joshd@protonmail.com>
# Contributors: Det, t3ddy, Lex Rivera aka x-demon, ruario


pkgname=iridium-bin
pkgver=58.0
pkgrel=1
pkgdesc="An attempt at creating a safer, faster, and more stable browser (Stable Channel)"
arch=('x86_64')
url="https://iridiumbrowser.de/"
license=('BSD')
depends=('alsa-lib' 'desktop-file-utils' 'flac' 'gconf' 'gnome-themes-standard' 'gtk2' 'harfbuzz' 'harfbuzz-icu'
         'hicolor-icon-theme' 'icu' 'libpng' 'libxss' 'libxtst' 'nss' 'opus' 'snappy' 'speech-dispatcher'
         'ttf-font' 'xdg-utils')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'ttf-liberation: fix fonts for some PDFs')
options=('!emptydirs' '!strip')

source=("https://downloads.iridiumbrowser.de/ubuntu/iridium-browser_current_amd64.deb"
)
sha256sums=('b40fb9b599234fe2c7ff555f534621043591d06140cd71b5bbe1b5b17194a7f3')
sha384sums=('68a17ec5b0f8e99cfa04b9a5d97f960db3e92c211781563ce9e058b33be5842795a5da53d092f71eeea2cab1b617fe7d')
sha512sums=('796a7f4bd37a2f5508920935381d1b8d53b53b3564cc01076716af1cf3798dc906431da32c733aa37822d8fe62dca81222f4678976fe4841f7bdb817499e2567')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  
 
}
