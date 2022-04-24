# Maintainer: darkhz <kmachanwenw@gmail.com>
pkgname=adbtuifm-bin
_pkgname=adbtuifm
pkgver=0.5.8
pkgrel=1
pkgdesc="A TUI File Manager for the Android Debug Bridge (ADB)"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/darkhz/adbtuifm"
license=('MIT')
depends=('android-tools')
provides=('adbtuifm')
conflicts=('adbtuifm')

source_x86_64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_i686=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_i386.tar.gz")
source_aarch64=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")

sha256sums_x86_64=("4ecd1e2b6353a854a4621ad255303b5494526ee7a81c9a28ebfd9b5d22432d39")
sha256sums_i686=("75261504b5672590039614b4a1cdc3ff9f1617ca18257781d288dec14ea2a1c4")
sha256sums_aarch64=("d651ac254953a3fe8e524622280a8918e56837ba2f170829328a08751ee2a629")

package() {
	install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
