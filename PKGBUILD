# Maintainer: Stevezxc <stevezhou586 at gmail dot com>
pkgname=ednovas-cloud
pkgver=1.1.93
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
sha512sums_x86_64=('0e22701b6c12cc60c7012df42f812136f358850538c962542e792c05262389ab063c6ec7058804685bb3ab7990d40de4dd6039d90f96e17681018f4612f5a53d')
sha512sums_aarch64=('4e2cb543847a41aa8c6c704e1614fc80c88094ce99533bdad3c7c70aa66735221d15e384f9e5a86906dda70777275fc2ad9e052075a3caac9e58849b05db055f')

package(){
	tar -xJ -f data.tar.xz -C "${pkgdir}"
}
