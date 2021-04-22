# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-maind
_pkgname=cro-chain-maind
pkgname=cro-chain-maind-bin
pkgdesc='Crypto.org Chain CLI'
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
pkgver=1.2.1
pkgrel=1
arch=('x86_64')
package="chain-main_${pkgver}_Linux_${arch}.tar.gz"
optdepends=('gtk-theme-murrine-collection')
source=(
  "${package}::${url}/releases/download/v${pkgver}/${package}"
)
sha512sums=('f2f99be906cf11e106ee43a66485d94206b2211bfd4af17d7396207cf40175f0963f2a53a69b9d64f0ed08ef0b92a180862c75bca39782e00b48475fc8ea2ab6')


package() {
  cd "$srcdir/"
  install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
