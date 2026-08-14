# Maintainer: Stevezxc <stevezhou586 at gmail dot com>
pkgname=ednovas-cloud
pkgver=1.1.56
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
sha512sums_x86_64=('ea7fc85ac9ddf1401aa09a3600a1df17601483590c5402866867efdc32a14acf03f18506e721489265fae64ea6acf79dfa8c9b9f7c9bce53f9defc2697a8228e')
sha512sums_aarch64=('b554a3f21741d448fba5ce96987c19c84b5731effcf474912ecedf218bbb65d414d6a8629846ca97a54d88c7f7c34f77b6461fa0e9fe16d5102eb5392ed01f1e')

package(){
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
