# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.1.6
pkgrel=2
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

sha256sums_x86_64=("5305296256cfb76534cb33fd0cbbc10c9637373ff7dd1462ed65625516810273")
sha256sums_i686=("e54f182aeb2625518c72eac17d3be9fdbbfd13c4fe9388177fbc7caece6002de")
sha256sums_arm=("a1eb5335e668df49872357818e7991b8ea3656f7541667348c6a9ccc0719b675")
sha256sums_aarch64=("a1eb5335e668df49872357818e7991b8ea3656f7541667348c6a9ccc0719b675")
sha256sums_armv6h=("fa78110b1d78f1414b2166f01531f350ffb5d8d9f206a094e227c160ba54403e")
sha256sums_armv7h=("2923d23dd9f7698dfafc9c4f0346305c7450a8e172e53b1179242869fe183e75")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
