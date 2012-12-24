# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot
pkgver=0.8.7_p1
pkgrel=1
pkgdesc="A system to automate the compile/test cycle required by most software projects"
arch=('any')
url="http://buildbot.net"
license=("GPL")
depends=('twisted' 'python2-jinja' 'python2-simplejson' 'python2-pysqlite'
	 'python2-migrate' 'python2-dateutil')
source=(http://buildbot.googlecode.com/files/buildbot-${pkgver/_/}.tar.gz)
md5sums=('bf3fa19e954adfa407d93dd7840c8975')

package() {
  cd "$srcdir"/buildbot-${pkgver/_/}
  python2 setup.py install --root="$pkgdir"
}
