# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.1.8
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

sha256sums_x86_64=("0f14380854fbb46916d10509056cde5a9fe7ff456764cc218a0a4303191a8579")
sha256sums_armv7h=("3da5a48affaa86896899e26c5890097dbb948b651212bfb74c18b9f9b58ce994")
sha256sums_aarch64=("6d90ad83cc383236715a14852907817f1225d308550d3012448824a9bc212854")
sha256sums_arm=("888e2bc11e574863104186e81628526cef44c0be3e8d2ef6ad7d3f122c2410e4")
sha256sums_i686=("c6b2aeaf44ece68024e7dde54c6eb01fe7afdfd1a70080168a152a1cbbc99b07")
sha256sums_armv6h=("e8b0d0f570100cd3c65f2e473bee857e25992bff58375690660d728c31c9d633")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
