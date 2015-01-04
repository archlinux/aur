# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot
pkgver=0.8.10
pkgrel=1
pkgdesc="A system to automate the compile/test cycle required by most software projects"
arch=('any')
url="http://buildbot.net"
license=("GPL")
depends=('python2-twisted' 'python2-jinja' 'python2-migrate' 'python2-dateutil')
source=(https://pypi.python.org/packages/source/b/buildbot/buildbot-$pkgver.tar.gz)
md5sums=('3201aaecf32df7810f4e23c14d20a544')

package() {
  cd "$srcdir"/buildbot-${pkgver/_/}
  python2 setup.py install --root="$pkgdir"
}
