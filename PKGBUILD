# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=pragmatapro-fonts
pkgver=0.9
pkgrel=1
pkgdesc="A condensed monospaced font optimized for screen, designed by Fabrizio Schiavi to be the ideal font for coding, math and engineering"
url="https://fsd.it/shop/fonts/pragmatapro/"
arch=(any)
license=(custom)
# Note: you need to buy the font at $url and place the zip file in the current or $SRCDEST directory.
source=('local://PragmataPro-Regular0.9-an1lqv.zip')
sha256sums=('89707c4fa2d55bcd2dea3a38511c91a6176fee8855245ca8529104abae9f466f')

options=("!strip")

package() {
  cd "PragmataPro-Regular${pkgver}"
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 *.ttf
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYRIGHT+EULA.txt
}
