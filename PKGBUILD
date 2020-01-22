# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='tarnation'
pkgver='1.2.0'
_commit='c5d8a17650b0b26e7d52ef4b274fea8d87c5c8b8'
pkgrel='1'
pkgdesc='Simple, extensible backup/restore utility based solely on GNU Tar'
arch=('any')
url="https://github.com/kennyparsons/$pkgname"
license=('GPL3')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('71fc0b90e733807cd836f6376d1e60980f797f48112157bf526984c7f61ec543')

package() {
	install -Dm755 "$srcdir/$pkgname-$_commit/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
