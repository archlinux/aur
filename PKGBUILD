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
source=("https://github.com/0xhkamori/mimose-binaries/releases/download/v1.8.8-20251207-151744/mimose-1.8.8-1-x86_64.pkg.tar.zst")
sha256sums=('50b76c16a38d5a90521421b8723ef184991b2cdf5d538240b5539d3f73a2cdb7')

package() {
  cp -a * "${pkgdir}/"
}
