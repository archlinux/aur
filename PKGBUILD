#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=xrandr-mgr
pkgver=2013.7
pkgrel=1
pkgdesc='Save and restore named xrandr states.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/xrandr-mgr"
depends=(arandr bash-statemgr)
source=(
  http://xyne.archlinux.ca/projects/xrandr-mgr/src/xrandr-mgr-2013.7.tar.xz
  http://xyne.archlinux.ca/projects/xrandr-mgr/src/xrandr-mgr-2013.7.tar.xz.sig
)
sha512sums=(
  58006516b51912f36bb21822963c429285c7d07a5da2b1d7e169b552cfb109f069fa89f7532701341d9ca3234b6e0e8c01cae94a062148fcec6bbdf627ebe9f4
  1dcbb12173175f90937ce734d5066163173c923e5a9849bb98d3976384bf28067c8eb51c6750e0e50e50900b0ed3c4a5c4a4c721b08c93572d73538f0f48aa2c
)
md5sums=(
  6bd046ee31b365ea13967580bc3509c9
  afbcfa60a243f6a2e06d86dbbc161363
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
