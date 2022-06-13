# Maintainer: XYenon <i at xyenon dot bid>

pkgname=go-cqhttp-bin

pkgver=1.0.0_rc2
pkgrel=1

pkgdesc='Lightweight, native cross-platform implementation of cqhttp in Golang.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/Mrs4s/go-cqhttp/releases'
license=('AGPL3')
install=go-cqhttp-bin.install

optdepends=('ffmpeg: support voice sending in any format')

provides=('go-cqhttp')

origin_pkgver="v${pkgver//_/-}"

source_i686=("${pkgname}-i686-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_386.tar.gz")
source_x86_64=("${pkgname}-x86_64-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_amd64.tar.gz")
source_armv7h=("${pkgname}-armv7h-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_armv7.tar.gz")
source_aarch64=("${pkgname}-aarch64-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_arm64.tar.gz")

sha512sums_i686=('00176676b4f203a8018ea82ef7bd862aeddcce2ec373a093cbcb8d6007dac333ff6d10ed2935e3a407900349d3b8fd260caca529cb104c1560f2bf8a21fcdd29')
sha512sums_x86_64=('53f2b3e138b1ecad1e96416b6185151f3314ff709572e9cf5e6476d115fd651a63c0408703abc0d43661bc30e93d2ab31fbb279bf266d711428aa532231d8af7')
sha512sums_armv7h=('2c8e05b815f2bdccc937519a9f7f3434754c415ea235947870e777b8af18742d3176d18a1750f8e4c2144db165be2cd7cff8f098d25dd4b2a60db49b5def5330')
sha512sums_aarch64=('fb4affd44a07158985b3cfeba7c4a0b3a8172170d49ed461f73febbfe53f68236d64bcd128ba6a1b94b9c6a375434fbae3cdc71e98892b1a2ded673684eb6a90')

package() {
    cd "${srcdir}"
    install -Dm755 'go-cqhttp' "${pkgdir}/usr/bin/go-cqhttp"
}
