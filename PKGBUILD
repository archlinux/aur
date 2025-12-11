pkgname=mimose-bin
pkgver=1.9.6
pkgrel=1
pkgdesc="Mimose – App that combines Spotify, Soundcloud, VK and Deezer."
arch=('x86_64')
url="https://mimose.site"
license=('proprietary')
depends=(
  alsa-lib at-spi2-core cairo dbus expat gcc-libs glib2 glibc gtk3
  hicolor-icon-theme libcups libdrm libnotify libsecret libx11 libxcb
  libxcomposite libxdamage libxext libxfixes libxkbcommon libxrandr
  libxss libxtst mesa nspr nss pango util-linux-libs xdg-utils
)
options=('!strip')
source=("https://github.com/0xhkamori/mimose-binaries/releases/download/v1.9.6-20251211-173322/mimose-1.9.6-1-x86_64.pkg.tar.zst")
sha256sums=('b511b860c5b5033fbdca0f1e3b7b89c522df820885e46e6aa2756868c44aeafa')

package() {
  cp -a * "${pkgdir}/"
}
