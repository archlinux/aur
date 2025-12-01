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
source=("https://github.com/0xhkamori/mimose-binaries/releases/download/v1.7.3-20251201-152259/mimose-1.7.3-1-x86_64.pkg.tar.zst")
sha256sums=('18f732f7c29e64612a3fd92dcfb0f23d807df2a6b37e65844648eaaf132939af')

package() {
  cp -a * "${pkgdir}/"
}
