# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot
pkgver=0.8.8
pkgrel=2
pkgdesc="A system to automate the compile/test cycle required by most software projects"
arch=('any')
url="http://buildbot.net"
license=("GPL")
depends=('twisted' 'python2-jinja' 'python2-migrate' 'python2-dateutil')
source=(http://buildbot.googlecode.com/files/buildbot-${pkgver/_/}.tar.gz)
md5sums=('472f512584bbb18cc677ca2ec3b3a905')

package() {
  cd "$srcdir"/buildbot-${pkgver/_/}
  python2 setup.py install --root="$pkgdir"
}
