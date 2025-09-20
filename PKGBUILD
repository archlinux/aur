# Maintainer: Programador Occidental

pkgname='pass-phrase'
pkgver=1.3
pkgrel=1
pkgdesc='A pass extension to generate passphrases.' 
arch=('any')
url='https://github.com/programadoroccidental/pass-phrase'
license=('GPL3')
depends=('pass')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha512sums=('32680a9fd6dd25ae8fca9ad310a80ef3938c1aebcb7a6a57321d91e44ba1ed3edef8ff51a2a306eadd406eea7236bb18f048e00e7f334a09998d2e86e10b7d1d'
            '8a4bc91dd484933c3311f6e465adfe964d0496d886de676a864cc89b76e7c06e7a9b1a8b6de65019f2f05dc6128aceaafba16dcda4193201da1c02ac237b0282')
validpgpkeys=('9635F79DD28A4A2D42385AD1D2FDE81DBBAFBE5C')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" FORCE_ALL=1 install
}
