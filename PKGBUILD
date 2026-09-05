# Maintainer: Stevezxc <stevezhou586 at gmail dot com>
pkgname=ednovas-cloud
pkgver=1.1.66
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
sha512sums_x86_64=('b6748d4603fd22723df67152fcdca135c15826880e385895386873dd6c38ec6292b50a9503f9c61a347b1757f4bc79e718f94343a6f25c5328df4ed4cc5e1064')
sha512sums_aarch64=('80159946d32eeab082fa0e1c3cdbee15be9d58a225f0d8a9511f5e31025f4536e17d92ca9868887ae76f26108f00bb50f9e193dd792f743af2f5d8510112e51f')

package(){
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
