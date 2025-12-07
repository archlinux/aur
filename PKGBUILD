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
source=("https://github.com/0xhkamori/mimose-binaries/releases/download/v1.8.8-20251207-154749/mimose-1.8.8-1-x86_64.pkg.tar.zst")
sha256sums=('d71feb54319d9c1c16602cfdcd3d062373ea8e6a4a3b53a73a29ff882e2c97ca')

package() {
  cp -a * "${pkgdir}/"
}
