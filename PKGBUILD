# Maintainer: darkhz <kmachanwenw at gmail dot com>
pkgname=bluetuith-bin
_pkgname=bluetuith
pkgver=0.1.5
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

sha256sums_x86_64=("7c22a7083d2120b4cecd7beb33df6f7eb574d9b1375dfd63f42dd92d78282e3c")
sha256sums_i686=("f224333610a131b6986d3772d1c0abad551b12cae9df8c810fc801f0d97a8514")
sha256sums_arm=("6506495fce9b473aa6f701e04e4ff61f32ef82ad31f5eaa4d1957263df1295f2")
sha256sums_aarch64=("4130627878722eda79329dc747d0fc8454ed66ee411d71bc9492145510467083")
sha256sums_armv6h=("be6c3b52c660af42ccbbcd7c1fdaf09da46fc104607262410c111682225277f6")
sha256sums_armv7h=("276fb9641c069b0e56db75f814b6b8b51a9c9ecd6719e9d46684264d4fc0ea97")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
