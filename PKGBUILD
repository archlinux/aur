# Maintainer: José San Juan <josesj@gmail.com>
pkgname=snapmakerjs
pkgver=2.7.1
pkgrel=2
pkgdesc="Snapmaker 3-in-1 Software"
url="http://www.snapmaker.com"
license=('custom')
depends=('gconf')
arch=('x86_64')
md5sums=('b6f700e09157553f161b21d12cd748fb')

source=(
	"https://s3-us-west-2.amazonaws.com/snapmaker.com/download/snapmakerjs/snapmakerjs-${pkgver}-linux-amd64.deb"
)

package() {
  cd "${srcdir}"
  tar -xf data.tar.xz -C "${srcdir}"
  mv "$srcdir/opt" "$pkgdir/"
  mv "$srcdir/usr" "$pkgdir/"
}
