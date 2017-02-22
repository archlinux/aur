# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=smart-units
pkgver=0.07
pkgrel=1
pkgdesc="A pretty clever command-line units converter. (written in Sidef)"
arch=('any')
url="https://github.com/trizen/smart-units"
license=('GPL3')
depends=('sidef')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('07c262014d32863a4f292505df334705476084427bdb861acd58a391117230ca')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D "$pkgname.sf" "$pkgdir/usr/bin/$pkgname"
}
