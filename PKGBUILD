# Maintainer: Javier Tia <floss@jetm.me>
_pkgname=markless
pkgname=markless-bin
pkgver=0.9.29
pkgrel=1
pkgdesc='A terminal markdown viewer with image support'
arch=('x86_64' 'aarch64')
url='https://github.com/jvanderberg/markless'
license=('MIT')
depends=('gcc-libs' 'glibc')
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/markless-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/markless-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('f476c0815f844d737efaed6049e25dbae431335ced01e963897b7856ca5c4736')
sha256sums_x86_64=('7c7911ee34707ff85dbbee2b7f588f4366067adbad2a3a4d5730d0165249599d')
sha256sums_aarch64=('3e0aad1172792475c11a3241eb6bc99a316e9efd900e3ea4401f6d8714dc81eb')

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
