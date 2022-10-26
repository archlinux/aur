# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-maind
_pkgname=cro-chain-maind
pkgname=cro-chain-maind-bin
pkgdesc='Crypto.org Chain CLI'
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
pkgver=3.3.7
pkgrel=1
arch=('x86_64')
_targz="chain-main_${pkgver}_Linux_${arch}.tar.gz"
source=("${_targz}::${url}/releases/download/v${pkgver}/${_targz}")
sha512sums=('41919471f5f3b3add4fafc43a843943150e4415435aecb771f55778ebc808918c46b362bff737d6a33c37e8f28937d37f600f3650847fc8d7704fe1bdd20d314')

package() {
  cd "$srcdir/"
  install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
