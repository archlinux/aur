# Maintainer: Stevezxc <stevezhou586 at gmail dot com>
pkgname=ednovas-cloud
pkgver=1.1.76
pkgrel=1
pkgdesc="EdNovas Cloud Proxy Client. Official desktop client for EdNovas Cloud services."
arch=('x86_64' 'aarch64')
url="https://ednovas.org"
license=('Apache-2.0')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator')
options=('!strip' '!debug')
source_x86_64=("https://storage.ednovas.org/desktop/${pkgver}/EdNovas-Cloud-${pkgver}-Linux-amd64.deb")
source_aarch64=("https://storage.ednovas.org/desktop/${pkgver}/EdNovas-Cloud-${pkgver}-Linux-arm64.deb")
sha512sums_x86_64=('9c04d7a2a0d4d69f5ca63c76ff25d3e3ec07c74028ffaae29469c56d62a62259cd1b738189f9caaa74ed41b473ac3d2be03d5b34374ee8b03d99c6d756bf7e59')
sha512sums_aarch64=('81d62ff3e9fe58b5d8ab8d3d898c3e1d2fdb04ea72a7f7a8b4e7b137b04204c4e5ae9cf9ab2b8e79398a8b839d712a91bb9c7ffede6256307e54462eea51b16b')

package(){
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
