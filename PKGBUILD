# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=smart-units
pkgver=0.11
pkgrel=1
pkgdesc="A pretty clever command-line units converter. (written in Sidef)"
arch=('any')
url="https://github.com/trizen/smart-units"
license=('GPL3')
depends=('sidef')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ff4d069800cb9aa2f41a342b756fac5bf5983fd2e658cf5a07c3b8a42526634c')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D "$pkgname.sf" "$pkgdir/usr/bin/$pkgname"
}
