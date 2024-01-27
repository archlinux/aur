# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='tarnation'
pkgver='1.2.0'
_commit='c5d8a17650b0b26e7d52ef4b274fea8d87c5c8b8'
pkgrel='1'
pkgdesc='Simple, extensible backup/restore utility based solely on GNU Tar'
arch=('any')
url="https://github.com/kennyparsons/$pkgname"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('db07ca1c535bd901c7ccb6909d1738377372349d472297cb726aff9b79baa2cf66489edb82b0cf4a068c7ca2a26c8ca992d1f1b5aa76af55344417cc8b49121f')

package() {
	install -Dm755 "$srcdir/$pkgname-$_commit/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
