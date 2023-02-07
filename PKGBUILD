# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-maind
_pkgname=cro-${_pkgbin}
pkgname=${_pkgname}-bin
pkgdesc='Crypto.org Chain CLI'
pkgver=4.2.2
pkgrel=1
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
arch=('x86_64')
_targz="chain-main_${pkgver}_Linux_${arch[0]}.tar.gz"
source=("${_targz}::${url}/releases/download/v${pkgver}/${_targz}")
sha512sums=('9e6c18825c6535e785897421c584bf46171a0f2f1ff27a31305d7ad744ad58e6e1ad86694ca4fecfca08bfecad4dd808d35862224ab11b908f0a375a304f21f7')

package() {
  install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
}
