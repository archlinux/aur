#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=obtheme
pkgver=2013.2.20.2
pkgrel=4
pkgdesc='A GUI theme editor for Openbox.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/obtheme"
depends=(python2 pygtk gtk2 python2-fuse)
source=(
  http://xyne.archlinux.ca/projects/obtheme/src/obtheme-2013.2.20.2.tar.xz
  http://xyne.archlinux.ca/projects/obtheme/src/obtheme-2013.2.20.2.tar.xz.sig
)
sha512sums=(
  5e7d1d187c0d5f3e6851b3a09be9aeed3b2708277940abd19efba4a501bf3ab20e0307f51e4b63e33ba07d301abf41607cec7074b3e478c9c5e6b065b3773f77
  6f678511de9d8f5017c5ea63146ea26d8b0d38424377b021fb478472384de944c3efae13c9e3fb0c63e8285d4ff30c2523eaf7ab1ac79634ee00e43de9fa9944
)
md5sums=(
  3623a3cefb9d665c29091a19ae6fdbf6
  88d4e8e93938776c8c47c8f1e6d2df18
)
install=obtheme.install
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}


# vim: set ts=2 sw=2 et:
