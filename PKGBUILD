# Maintainer: Stevezxc <stevezhou586 at gmail dot com>
pkgname=ednovas-cloud
pkgver=1.1.55
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
sha512sums_x86_64=('c6efaddf349c0d61a7dc1c4ad5c1622e4b751b7454d2607de940768437d2a965ac987e914eaa1c23c8e5a69a4391873d3774c2b21f5338fd3774964cd5f5089f')
sha512sums_aarch64=('2f71658c751c1fbd1c636b530d08cb14bea6c64fc7c6bb190f423316fd27de89c6cc49b36b5ac64311474095a2aa51074c5fddd34e5997879c5ffb28eb69c454')

package(){
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
