# Maintainer: Michael Düll <mail@akurei.me> PGP-Key: AAAEE882
pkgname=pdf2book
pkgver=1
pkgrel=3
pkgdesc="Rearranges the pages in a PDF to be printed as a book (or booklet). Print double-sided in \"short-edge\" mode."
arch=('any')
url="http://www.documentroot.net/linux/linux-buecher-broschueren-drucken"
license=('custom')
depends=('psutils')
source=('pdf2book'
        'LICENSE')

package() {
  cd "$srcdir/"
  install -d ${pkgdir}/usr/bin/
  install -d ${pkgdir}/usr/share/licenses/pdf2book
  install -Dm 755 pdf2book ${pkgdir}/usr/bin/
  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/pdf2book/
}

# vim:set ts=2 sw=2 et:
sha512sums=('49f32407f6511cac4070ec07259d2c25622b7856d29b3fb9c6de697f79df0df6b111cde2e4fe485869603299690f08493b926a378ffd9e00bd82a76f17bab89c'
            'dc2e70c3e8bc5d135b694bad786258ef29437d23ce5919039ae5848a0aa29b0a336d1a501f58e348202b47cf031081d2a3ed391b17532d24f9b8a05008c60a17')
