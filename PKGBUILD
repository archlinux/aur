# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.0.9
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

sha256sums_x86_64=("14c69084f614e561bc11bc11af06de847f630ffe493045aea9babf4ea397f82a")
sha256sums_i686=("5dda55e3a23992e9448a69ca9c1451fc18d5e93f885f3bab2578a5e974d42918")
sha256sums_arm=("2e056ea4cacf162823645d77b7ef53473a669099f9ae94ea474a5ac8776731e3")
sha256sums_aarch64=("c21e3a4f51425969c3c3d7709a955ef0912e4d80b15ac11b5f94720e319dfe24")
sha256sums_armv6h=("62459adf2f6bedfa9970d98738064d66633dde8b008e2526b6262900ac58a6f0")
sha256sums_armv7h=("4480bd6febec43d23912a505f337ca4addd6bdb0e26c37433286869f79da0f2f")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
