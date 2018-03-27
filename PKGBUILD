# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=png2uri
pkgver=1.0.6
pkgrel=2
pkgdesc='Shellscript for converting a single PNG file or datastream into an HTML data URI'
url='http://pmt.sourceforge.net/png2uri'
arch=('any')
license=('custom')
depends=('sh')
source=(https://sourceforge.net/projects/pmt/files/$pkgname/$pkgver/$pkgname
        https://sourceforge.net/projects/pmt/files/$pkgname/$pkgver/$pkgname-README.txt)
sha512sums=('02ba9a1775873c5ef6403a8211171bb25f9b2bd462d2bb89ce8fc4bd139d57fb5308e6daea6d882e435e5304d59646b7d8af8ed92abbbd8a6668356cb947615e'
            '5163cb6a4f18c3ed222e347ed8534c142a084e358521c0f8b38096a2d385ba6b6c8830e424410539b50c079772cd9a9c42764d7740b539f6d865b53412607437')

package() {
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm 644 $pkgname-README.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
