# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.0.8
pkgrel=1
pkgdesc="A TUI based bluetooth manager"
arch=('x86_64' 'i686' 'arm' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/darkhz/bluetuith"
license=('MIT')
depends=('bluez' 'dbus')
optdepends=('networkmanager: For PANU networking'
            'modemmanager: For DUN networking')
provides=('bluetuith')
conflicts=('bluetuith')

source_x86_64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_arm=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv5.tar.gz")
source_aarch64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv7.tar.gz")

sha256sums_x86_64=("eb1b3e7b4cb4539973fd32d3e9fe3c15bfabe5faee1b44fd2628959b7b67de0c")
sha256sums_i686=("c281d5dec664d3c11089a395bf48c24ea311881adca7a2b7e0386bbc44da6f08")
sha256sums_arm=("56113e6a07227aa6898b6c6d179b7843b9ed289916e53b3683a280af31b5b694")
sha256sums_aarch64=("ebac6668871f503a835d0cdb67ef99b1ae77776818576bce761064dcff22fd50")
sha256sums_armv6h=("3eacb6d0e6e683aca76437639b5e534b4f256a96a4290b796789eae4a0c3905b")
sha256sums_armv7h=("ef0cd1b08f177279fe78ac994497f03fb4f7ab9eacd7a1573a87c97cecafab7e")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
