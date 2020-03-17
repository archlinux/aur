# Maintainer: Michael Hauser-Raspe
pkgname=wal-g # '-bzr', '-git', '-hg' or '-svn'
pkgver=v0.2.14
pkgrel=1
pkgdesc="WAL-G is an archival restoration tool for Postgres(beta for MySQL, MongoDB, and Redis)"
arch=('x86_64')
url="https://github.com/wal-g/wal-g"
license=('Apache')
#depends=('bash')
makedepends=('tar') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("$pkgname")
source=("https://www.github.com/$pkgname/$pkgname/releases/download/$pkgver/wal-g.linux-amd64.tar.gz")
md5sums=('7d81f935cbfa431ff914be696f5ca5cc')

package() {
	cd $srcdir
	tar xvfz wal-g.linux-amd64.tar.gz
  mkdir -p $pkgdir/usr/local/bin/
	mv wal-g $pkgdir/usr/local/bin/
}
