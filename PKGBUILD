# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-maind
_pkgname="cro-${_pkgbin}"
pkgname="${_pkgname}-bin"
pkgdesc='Crypto.org Chain CLI'
pkgver=4.2.5
pkgrel=1
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
arch=('x86_64')
_targz="chain-main_${pkgver}_Linux_${arch[0]}.tar.gz"
source=("${_targz}::${url}/releases/download/v${pkgver}/${_targz}")
sha512sums=('709a1024716934947bf7f4b9d7d03483d0f84ef3db478fcc7493f6a53a39034ecfe4c37a12d9e15c94256a2180e6de19916d872e52852353d6c4bb454657cb2d')

package() {
  install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
}
