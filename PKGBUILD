# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-maind
_pkgname=cro-chain-maind
pkgname=cro-chain-maind-bin
pkgdesc='Crypto.org Chain CLI'
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
pkgver=3.3.9
pkgrel=1
arch=('x86_64')
_targz="chain-main_${pkgver}_Linux_${arch}.tar.gz"
source=("${_targz}::${url}/releases/download/v${pkgver}/${_targz}")
sha512sums=('6a12e1cffb7ef96d0521318c3e5a3fd3ac4255df99d4a9adcdfc5027e451cf044673987839564576a4b0b4fdaa153bdc872d966b3831dd3240f9f9e6f92d3b52')

package() {
  cd "$srcdir/"
  install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
