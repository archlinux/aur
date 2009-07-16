# $Id: PKGBUILD,v 1.13 2009/05/22 10:24:30 abhidg Exp $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buildbot
pkgver=0.7.10p1
pkgrel=1
pkgdesc="A system to automate the compile/test cycle required by most software projects"
arch=('i686' 'x86_64')
url="http://buildbot.sourceforge.net"
license=("GPL")
depends=('twisted')
source=(http://downloads.sourceforge.net/buildbot/buildbot-$pkgver.tar.gz)
md5sums=('38475c54ff26ab4028cfd371b3f76c1f')

build() {
  cd $startdir/src/buildbot-$pkgver
  python setup.py install --root=$startdir/pkg
}
