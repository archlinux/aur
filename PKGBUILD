# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=smart-units
pkgver=0.06
pkgrel=1
pkgdesc="A pretty clever command-line units converter. (written in Sidef)"
arch=('any')
url="https://github.com/trizen/smart-units"
license=('GPLv3')
depends=('sidef')

source=("https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d56445de81598331ebf39cc89d7306011ea8fcd8dc9696c79134d095059b7360')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D "$pkgname.sf" "$pkgdir/usr/bin/$pkgname"
}
