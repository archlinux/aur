# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=jcl
pkgver=0.1rc2
pkgrel=1
_commit=6893bcf7f720a7b0beeaed5f433539d0b06d3b1a
pkgdesc="jabber component library"
arch=(any)
url="https://github.com/dax/jcl"
license=("GPL")
backup=(etc/ejabberd/jmc.xml)
depends=('python2' 'python2-pysqlite' 'python2-sqlobject')
makedepends=('git' 'python2-setuptools')
source=("git+https://github.com/dax/jcl.git#commit=${_commit}")
sha256sums=('SKIP')

package() {
  cd "$srcdir/jcl"
  python2 setup.py install --root="$pkgdir"
}
