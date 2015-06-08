# Maintainer: Gonzalez David <david.gonzalez0005 at gmail dot com>

pkgname=fulgur-git
_pkgname=fulgur
pkgver=20150331
[ "1" = "1" ] && pkgver=`date +"%Y%m%d"`
pkgrel=1
pkgdesc="A complete, graphical and on the fly power manager"
arch=('any')
url='https://github.com/davetec/fulgur'
license=('MIT')
depends=('python' 'python-gobject' 'librsvg')
optdepends=()
makedepends=()
install=fulgur.install

source=("git://github.com/davetec/fulgur.git")
md5sums=('SKIP')

package() {
    cd $srcdir/$_pkgname/
    python setup.py install --root=$pkgdir --with-initscript='systemd'
}
