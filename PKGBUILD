# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=large-c
pkgver=0.05
pkgrel=1
pkgdesc="a pseudo-interpreter of the C programming language"
arch=('any')
url="http://labs.cybozu.co.jp/blog/kazuhoatwork/2006/01/c.php"
license=('GPL2')
depends=('perl' 'gcc')
source=(http://labs.cybozu.co.jp/blog/kazuhoatwork/my_projects/c/C)
md5sums=('3e62807bd6d2ea82ec48bee387562386')

package() {
  install -Dm755 C "$pkgdir/usr/bin/C"
}

