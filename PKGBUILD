# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.1.9
pkgrel=1
pkgdesc="A TUI based bluetooth manager"
arch=('x86_64' 'i686' 'arm' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/darkhz/bluetuith"
license=('MIT')
depends=('bluez' 'dbus')
optdepends=('networkmanager: For PANU networking'
            'modemmanager: For DUN networking'
	    'pulseaudio: For switching device audio profiles')
provides=('bluetuith')
conflicts=('bluetuith')

source_x86_64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_arm=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv5.tar.gz")
source_aarch64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv7.tar.gz")

sha256sums_armv7h=("0525d2bb048db4246fb6b4430274b8ec66f35278da72d785eeced9fb4fe95102")
sha256sums_i686=("421b2e995a2ae83f1b83ba0a9d601d1cc824cea651658308a06a74063782cb3d")
sha256sums_aarch64=("4475f331eddaf605af3cdab72a5f49b152b7f2a595bd27392b86540bb1575e7b")
sha256sums_x86_64=("529d66902ea84de549c10d41c3e262e308086630aeb397c19bede168d1c27188")
sha256sums_armv6h=("ce00cb6da7495cddb684c3d6d62bf965a8655b9b41c178037232326524187d36")
sha256sums_arm=("eb8945849a6b654863cbc1be1afdddbae2a18fd64d3282b946a7d4e4d95c6a0a")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
