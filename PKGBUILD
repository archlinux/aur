# Maintainer: Stevezxc <stevezhou586 at gmail dot com>
pkgname=ednovas-cloud
pkgver=1.1.82
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
sha512sums_x86_64=('e94c878a0f4f6c7eba9ebe20d87a700757fb7304fef2fd6afff9adc18228c2b17a172783ba30eb82a62519a13bb487fc165bdca2a752bb7a5a6d364b6b59b69d')
sha512sums_aarch64=('beddb405990b3ecab30d5a8493a59018760585ca0df729b13f0d805926f8a5f15c2054f006739043f8c7b11ea907a2289d86bdbdd1c0bc35bb03befd44998f43')

package(){
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
