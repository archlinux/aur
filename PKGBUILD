pkgname=mimose-bin
pkgver=1.9.2
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
source=("https://github.com/0xhkamori/mimose-binaries/releases/download/v1.9.2-20251210-200959/mimose-1.9.2-1-x86_64.pkg.tar.zst")
sha256sums=('2b0ddc6dded5cfb0c80baa76fe75fc988f25abfed3bf7926d9a6e02c6f25fba9')

package() {
  cp -a * "${pkgdir}/"
}
