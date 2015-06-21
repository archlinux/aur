# Maintainer: Mike Sampson <mike AT sambodata com>
# Contributor: Laurent Hilsz <laurent hilsz AT gmail com>
# Contributor: Nathan Owe <ndowens04+AUR at gmail dot com>
pkgname=dd_rhelp
pkgver=0.3.0
pkgrel=1
pkgdesc="a bash script that handles a very usefull program called dd_rescue."
url="http://www.kalysto.org/utilities/dd_rhelp/index.en.html"
arch=('any')
license=('GPL')
depends=('ddrescue' 'bc' 'bash')
source=(http://www.kalysto.org/pkg/$pkgname-$pkgver.tar.gz)
md5sums=('302f51dff914bfa71268ed57778fe2a6')

build() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/bin
  install -m755 dd_rhelp  $pkgdir/usr/bin
}
