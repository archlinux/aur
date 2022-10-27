# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-maind
_pkgname=cro-chain-maind
pkgname=cro-chain-maind-bin
pkgdesc='Crypto.org Chain CLI'
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
pkgver=3.3.8
pkgrel=1
arch=('x86_64')
_targz="chain-main_${pkgver}_Linux_${arch}.tar.gz"
source=("${_targz}::${url}/releases/download/v${pkgver}/${_targz}")
sha512sums=('e041181305765b97409c59488058a8fb8dc0fe59711405586e6e84f13d244a7fe3f3efbb332cb0b08395e9f3b106e3c2f23276aebbba9182e34475ed42ff9750')

package() {
  cd "$srcdir/"
  install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
