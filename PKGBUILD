# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot
pkgver=0.8.3p1
pkgrel=1
pkgdesc="A system to automate the compile/test cycle required by most software projects"
arch=('any')
url="http://buildbot.net"
license=("GPL")
depends=('twisted>=10.2.0' 'python-jinja' 'python-simplejson' 'python-pysqlite')
source=(http://buildbot.googlecode.com/files/buildbot-$pkgver.tar.gz)
md5sums=('919ab66090bcadd12b4db3198511e94b')

build() {
  cd $srcdir/buildbot-$pkgver
  python2 setup.py install --root=$pkgdir
}
