# Maintainer: J. Nathanael Philipp <nathanael@philipp.land>
pkgname=psync
pkgver=0.2.5
pkgrel=1
pkgdesc="Python wrapper for rsync"
arch=('any')
url="https://github.com/jnphilipp/psync"
license=('GPL3')
makedepends=('git' 'help2man')
depends=('python-lxml' 'rsync')
source=('psync::git://github.com/jnphilipp/psync.git')
md5sums=(SKIP)

package() {
    cd "$srcdir/$pkgname"
    git checkout $pkgver
    make install BASH_COMPLETION_DIR=$pkgdir/usr/share/bash-completion.d BIN_DIR=$pkgdir/usr/bin DOC_DIR=$pkgdir/usr/share/doc MAN_DIR=$pkgdir/usr/share/man SHARE_DIR=$pkgdir/usr/share
}
