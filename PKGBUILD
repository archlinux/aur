# Current Maintainer: necklace <ns@nsz.no>
# Original Packager: sunnaryt <joshd@protonmail.com>
# Contributors: Det, t3ddy, Lex Rivera aka x-demon, ruario

pkgname=iridium-deb
pkgver=67.0
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

sha256sums=('1e89367b3866682a55fb450c23318009cbf02b1ba423ec08482742328fdf46fb')
sha384sums=('1b50c929eab384bf9411d21d157db5293dfef7247d4f42b3e932ac8eddd1ba1145a9656c0f3a8c8a79f74c23a8305ac7')
sha512sums=('e54418649add05348328300b39bfa0b094199aecac0d2eea3a27fb03df6aaa0f9fba3588558e26b2df8fc26ea34d095eaaffea2287141b53f2864d66232d1673')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
