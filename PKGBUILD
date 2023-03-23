# Maintainer: Luca Anastasio <anastasio dot lu at gmail dot com>
pkgname=remoteit-desktop-bin
pkgver=3.15.8
pkgrel=1
pkgdesc="Remote.it cross platform desktop application for creating and hosting connections"
url="https://remote.it/"
arch=('i686' 'x86_64')
license=('custom')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'dbus' 'desktop-file-utils' 'discord' 'expat' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libcups' 'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'util-linux-libs' 'xdg-utils')
optdepends=()
makedepends=()
conflicts=('remoteit' 'remoteit-desktop')
replaces=()
backup=()
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://downloads.remote.it/desktop/v${pkgver}/remoteit-installer-amd64.deb")
md5sums=('a9fcc7ab0503db63981d022e1ce5e38f')

package() {
  tar xf data.tar.xz -C "${pkgdir}"
  install -D -m644 "${pkgdir}/opt/remoteit/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
