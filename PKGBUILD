#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=obtheme
pkgver=2013.2.20.2
pkgrel=7
pkgdesc='A GUI theme editor for Openbox.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/obtheme"
depends=(gtk2 pygtk python2 python2-fuse)
source=(
  https://xyne.dev/projects/obtheme/src/obtheme-2013.2.20.2.tar.xz
  https://xyne.dev/projects/obtheme/src/obtheme-2013.2.20.2.tar.xz.sig
)
sha512sums=(
  5e7d1d187c0d5f3e6851b3a09be9aeed3b2708277940abd19efba4a501bf3ab20e0307f51e4b63e33ba07d301abf41607cec7074b3e478c9c5e6b065b3773f77
  636737e4a78c10f4278fe18ff170e03a982989a11e13b93237a78fffbe70e3937d5af1a0ab9e80710905baf729abe0a45e679898b111a7c299140e35f0f234d9
)
md5sums=(
  3623a3cefb9d665c29091a19ae6fdbf6
  55627f3807d73263be359773470492f7
)
install=obtheme.install
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}


# vim: set ts=2 sw=2 et:
