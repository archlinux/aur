# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot
pkgver=0.8.1p1
pkgrel=2
pkgdesc="A system to automate the compile/test cycle required by most software projects"
arch=('any')
url="http://buildbot.net"
license=("GPL")
depends=('twisted' 'python-jinja' 'python-simplejson' 'python-pysqlite')
source=(http://downloads.sourceforge.net/buildbot/buildbot-$pkgver.tar.gz)
md5sums=('fc12c0e94e246b9b12c80a0baf72de08')

build() {
  cd $srcdir/buildbot-$pkgver
  python2 setup.py install --root=$pkgdir
}
