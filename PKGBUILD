# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot
pkgver=0.8.1
pkgrel=1
pkgdesc="A system to automate the compile/test cycle required by most software projects"
arch=('any')
url="http://buildbot.net"
license=("GPL")
depends=('twisted')
source=(http://downloads.sourceforge.net/buildbot/buildbot-$pkgver.tar.gz)
md5sums=('53b7defb3f8919413907990269b7566d')

build() {
  cd $srcdir/buildbot-$pkgver
  python setup.py install --root=$pkgdir
}
