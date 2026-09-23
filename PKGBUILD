# Maintainer: Stevezxc <stevezhou586 at gmail dot com>
pkgname=ednovas-cloud
pkgver=1.1.75
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
sha512sums_x86_64=('4d9d52184bd2efa2cc148f2ed51a5bea5dd14183d3f11f827651ac5366ba55f708d8f84021ad8d08b6c09a6d3a9b6bc56e8a7cec87a916aa6a057a9070b169fe')
sha512sums_aarch64=('4774b25f909d1dc8990e7f03c5f55b2a76b747bdfe3a38d73330f4af9701303b3b6c2b6d6d1bb683ed83e1b675d7afe22e9e6be091b045bc937e6f58dd252187')

package(){
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
