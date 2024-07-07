# Maintainer: Jan Claussen <jan dot claussen10 at web dot de>
pkgname=totk-mod-manager-bin
_pkgname=totk-mod-manager
pkgver=0.9.7
pkgrel=3
pkgdesc="Open-source application, designed to assist players of Zelda: Tears of the Kingdom on the Yuzu emulator in managing mods for the game"
arch=(x86_64)
url="https://github.com/vasilvestre/totk-mod-manager-for-switch-emulators"
license=('BSD-3-Clause')
depends=(openssl-1.1 webkit2gtk)
options=(!strip)
provides=("totk-mod-manager")
replaces=("totk-mod-manager" "totk-mod-manager-git")
source_x86_64=("${_pkgname}-${pkgver}.deb::https://github.com/vasilvestre/totk-mod-manager-for-switch-emulators/releases/download/v${pkgver}/zelda-tears-of-the-kingdom-mod-manager_0.9.6_amd64.deb")

sha256sums_x86_64=('42e95d1d06e4450b5889c39bddcb5d2c9883f8a5d771feddea2bbd0e8b8a04ba')

package() {
	tar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
