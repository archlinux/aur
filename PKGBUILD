# Submitter: Adriaan Zonnenberg <amz@adriaan.xyz>
# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>

pkgname=git-open
pkgver=2.1.0
pkgrel=1
pkgdesc='Open a repo website (GitHub, GitLab, Bitbucket) in your browser'
arch=('any')
url='https://github.com/paulirish/git-open'
license=('MIT')
depends=('git' 'xdg-utils')
conflicts=('nodejs-git-open')
source=("https://github.com/paulirish/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0cf7f7f55c611c8dfccf0a3135df4032f2ea085491be84fb565cac2d744c4951')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -D -m755 "$srcdir/$pkgname-$pkgver/git-open" "$pkgdir/usr/bin/$pkgname"
}
