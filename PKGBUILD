# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot
pkgver=0.8.2
pkgrel=1
pkgdesc="A system to automate the compile/test cycle required by most software projects"
arch=('any')
url="http://buildbot.net"
license=("GPL")
depends=('twisted' 'python-jinja' 'python-simplejson' 'python-pysqlite')
source=(http://downloads.sourceforge.net/buildbot/buildbot-$pkgver.tar.gz)
md5sums=('a377f79b8e59c29891886eb980dc8703')

build() {
  cd $srcdir/buildbot-$pkgver
  python2 setup.py install --root=$pkgdir
}
