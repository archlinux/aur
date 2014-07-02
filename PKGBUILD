# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot
pkgver=0.8.9
pkgrel=1
pkgdesc="A system to automate the compile/test cycle required by most software projects"
arch=('any')
url="http://buildbot.net"
license=("GPL")
depends=('twisted' 'python2-jinja' 'python2-migrate' 'python2-dateutil')
source=(https://pypi.python.org/packages/source/b/buildbot/buildbot-$pkgver.tar.gz)
md5sums=('b4c723d1e0324ea19511e622e420c6e7')

package() {
  cd "$srcdir"/buildbot-${pkgver/_/}
  python2 setup.py install --root="$pkgdir"
}
