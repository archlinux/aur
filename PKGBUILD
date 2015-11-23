# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=smart-units
pkgver=0.03
pkgrel=1
pkgdesc="A pretty clever command-line units converter. (written in Sidef)"
arch=('any')
url="https://github.com/trizen/smart-units"
license=('GPLv3')
depends=('sidef')

source="https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz"
sha256sums=('9791e7143e980ef34576559c40394a11cccbd456950354dad98902960ce7b1bc')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D "$pkgname.sf" "$pkgdir/usr/bin/$pkgname"
}
