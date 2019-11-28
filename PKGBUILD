# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=smart-units
pkgver=0.09
pkgrel=1
pkgdesc="A pretty clever command-line units converter. (written in Sidef)"
arch=('any')
url="https://github.com/trizen/smart-units"
license=('GPL3')
depends=('sidef')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('deb3758350339a0ffc4833f047e3cbb73014f0943feaf25fb571f0a25ca4d54e')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D "$pkgname.sf" "$pkgdir/usr/bin/$pkgname"
}
