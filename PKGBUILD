# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=pragmatapro-fonts
pkgver=0.904
pkgrel=1
epoch=1
pkgdesc="A condensed monospaced font optimized for screen, designed by Fabrizio Schiavi to be the ideal font for coding, math and engineering"
url="https://fsd.it/shop/fonts/pragmatapro/"
arch=(any)
license=(custom)
# Note: you need to buy the font at $url and place the zip file in the current or $SRCDEST directory.
source=('local://PragmataPro-fialk8-6rjkhe.zip')
sha256sums=('2d52174c2a478a3176ac25693894496c89c8448ef745b71e4285c39d85f54ed8')


package() {
  cd "PragmataPro${pkgver}"
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 *.ttf
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYRIGHT+EULA.txt
}
