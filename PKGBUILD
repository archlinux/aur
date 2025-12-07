pkgname=mimose-bin
pkgver=1.8.8
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
source=("https://github.com/0xhkamori/mimose-binaries/releases/download/v1.8.8-20251207-014723/mimose-1.8.8-1-x86_64.pkg.tar.zst")
sha256sums=('bc320245e6b55e158bba35e005a5c8db6ec1c380f3f2c82b34e098a37f8b5f57')

package() {
  cp -a * "${pkgdir}/"
}
