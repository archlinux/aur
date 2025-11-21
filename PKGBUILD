# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=pragmatapro-fonts
pkgver=0.903
pkgrel=1
epoch=1
pkgdesc="A condensed monospaced font optimized for screen, designed by Fabrizio Schiavi to be the ideal font for coding, math and engineering"
url="https://fsd.it/shop/fonts/pragmatapro/"
arch=(any)
license=(custom)
# Note: you need to buy the font at $url and place the zip file in the current or $SRCDEST directory.
source=('local://PragmataPro-fialk8-6rjkhe.zip')
sha256sums=('770400e9d4f3d40fe8893af9ae1f784f6ffad241fc4189128c4d3c4615fb7727')

options=("!strip")

package() {
  cd "PragmataPro${pkgver}"
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 *.ttf
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYRIGHT+EULA.txt
}
