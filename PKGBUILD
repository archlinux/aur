# Maintainer: Stevezxc <stevezhou586 at gmail dot com>
pkgname=ednovas-cloud
pkgver=1.1.30
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
sha512sums_x86_64=('b8c7cb6efa0b07d752bd43903913f110ba9870fc4d866d371c39e199fa68b4351d1cafc5874aa2d82be9df528fe4187b933985977bf368dd8b1451cc3cde24e3')
sha512sums_aarch64=('be14f06111a242edc4d13788ec0cdb363ced07cd3b38bdc85bdd2cbe0ba0c7878b84c7a6f18722567e5b98c81371dc8fb6cc6cb0ed7cc635a0aa8c4f8f203f8b')

package(){
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
