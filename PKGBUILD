# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: Mika Hynnä <mika.hynna@wippies.com>

pkgname=wbarconf
pkgver=0.7.2.2
pkgrel=1
pkgdesc="Configuration GUI for wbar written in Python and GTK"
arch=(arm i686 x86_64)
url="http://kapsi.fi/ighea/wbarconf/"
license=('GPL')
depends=('python2' 'pygtk' 'pygobject' 'wbar')
source=(http://kapsi.fi/ighea/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname
  sh ./install.sh $startdir/pkg/usr || return 1
}

md5sums=('5a7a82768883ab79e3313035d6887ad0')
