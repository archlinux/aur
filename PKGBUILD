# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot
pkgver=0.8.6p1
pkgrel=1
pkgdesc="A system to automate the compile/test cycle required by most software projects"
arch=('any')
url="http://buildbot.net"
license=("GPL")
depends=('twisted' 'python2-jinja' 'python-simplejson' 'python-pysqlite'
	 'python2-migrate')
source=(http://buildbot.googlecode.com/files/buildbot-$pkgver.tar.gz)
md5sums=('b6727d2810c692062c657492bcbeac6a')

build() {
  cd $srcdir/buildbot-$pkgver
  python2 setup.py install --root=$pkgdir
}
