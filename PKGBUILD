# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=pragmatapro-fonts
pkgver=0.903
pkgrel=1
pkgdesc="A condensed monospaced font optimized for screen, designed by Fabrizio Schiavi to be the ideal font for coding, math and engineering"
url="https://fsd.it/shop/fonts/pragmatapro/"
arch=(any)
license=(custom)
# Note: you need to buy the font at $url and place the zip file in the current or $SRCDEST directory.
source=('local://PragmataPro-Regular-nhfug6.zip')
sha256sums=('53f5d4cc1f04af1f6750d02a4fc9f623714d153d5120e86c870f89d44d7ac156')

options=("!strip")

package() {
  cd "PragmataPro-Regular${pkgver}"
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 *.ttf
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYRIGHT+EULA.txt
}
