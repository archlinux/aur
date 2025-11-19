# Maintainer: Daniele Paolella <danpaolella@gmail.com>
# Contributor: mmh <aur@with-h.at>

pkgname=git-store-meta
pkgver=2.3.7
pkgrel=1
pkgdesc="Simple file metadata storing and applying for git"
arch=('any')
url="https://github.com/danny0838/git-store-meta"
license=('MIT')
depends=('git>=1.7.2' 'perl>=5.8')
optdepends=('acl: for manipulating ACL metadata')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.tar.gz::https://github.com/danny0838/git-store-meta/archive/$pkgver.tar.gz")
sha256sums=('86ab4b587e0dbe7b6458bdebd6b97bf1aac9010d3c029be93934118736811bfe')

package() {
	cd "$pkgname-$pkgver"
	install -D git-store-meta.pl "$pkgdir/usr/bin/git-store-meta.pl"
	install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
