#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2016.4.4.1
pkgrel=1
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pbget"
depends=(git pm2ml python3 python3-aur python3-xcgf python3-xcpf)
source=(
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2016.4.4.1.tar.xz
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2016.4.4.1.tar.xz.sig
)
sha512sums=(
  e383c50f25dfb890147554dc737535d6bf6072179ac861a22ac8c1dda47c0dbf7494ab1ef67fc0b1a1a248199d89f74c8a5bfc80c16a700d236cbe581cadb20c
  1d55bfc4683f10a72a9758e8695a0b62da22e927fc6aba045c6159c07ca1a0b02a7dd173d2d9f2d043c339b3e4eccb5095c0434f053fcf68c6a85c7d0d82e26d
)
md5sums=(
  dd307a52f3bf7e6af6a1f64dad24b967
  8c1ba5bcf778959d0f957ad9fe6e9474
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
