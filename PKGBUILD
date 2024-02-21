# Contributor: Alex Suykov <axs@ukr.net>

pkgname=ttf-code2002
epoch=1
pkgver=0.922
pkgrel=1
pkgdesc="beta test font for Plane Two"
arch=('any')
url="https://www.code2001.com/"
license=('custom')
source=("CODE2002-$pkgver.ZIP::http://www.code2001.com/CODE2002.ZIP")
md5sums=('b3bbbd97bb503b9428eb020c1ed36e88')
sha256sums=('eea3069c4349eacff6c0fddeff221e125e8faecd3098f8babfc6c2492b48ec3c')
sha512sums=('4d4e10d9889d53006e04d56fb06d7a893777d951d23a469ea7b42a2d38c831e8fd06ca07d73d8b81bf868620ef30678612f9139f8cf94ca1611a49343c40e4be')

package() {
  install -D -m644 CODE2002.TTF "$pkgdir/usr/share/fonts/TTF/Code2002.ttf"
}
