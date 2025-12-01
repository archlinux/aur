# Maintainer: hkamori
pkgname=mimose-bin
pkgver=1.7.3
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
source=("https://github.com/0xhkamori/mimose-aur/releases/download/v${pkgver}/mimose-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('33ef2ab492d8d585db63c4b62d946fb22bba51f78d6606ec1678bdbf6ab9c3c0')

package() {
  cp -a * "${pkgdir}/"
}
