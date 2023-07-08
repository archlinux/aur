# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.1.6
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

sha256sums_x86_64=("f7dd8e2758f0ce3b3f4090a03672d4790d142b6f610f0f6407cc8e9ed52a9534")
sha256sums_i686=("c2f68dac8cb1c9313cf05d040d3e300073f363b2b6e23588f29135cc57167196")
sha256sums_arm=("027ccb146cc4c113fd5ec306c4f4238a23c8b4c2809c53eeae967540bde70ae9")
sha256sums_aarch64=("7a86979fd789ba9766432f4bd5701520157560b582b1c0b83d81d853343bdd52")
sha256sums_armv6h=("4b8be0742854266fdfc927bb7ba037b203219bce1f4723f716acca1f06606376")
sha256sums_armv7h=("2dce5d680172310ce912b0bbd8ffd7d590bca09bb3412d287fc02d9a9342b43e ")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
