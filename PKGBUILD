#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2015.12.19.1
pkgrel=1
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pbget"
depends=(pm2ml python3 python3-aur python3-xcgf python3-xcpf)
source=(
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2015.12.19.1.tar.xz
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2015.12.19.1.tar.xz.sig
)
sha512sums=(
  9dd3b80c6f3e39f0703b5154b73446de22a882678ddf608205d87937e20e4697a57ad65aaac727e2ad459a6d512ca063b878de760f36357b7f4495d13544c5eb
  698ab9de7ee6fdcf122a4f9f59bba04a74b10a668ed3c7e655a28d9102c05580baa0d9f169e9292637364d8d0567dbfd6ec901ed5f3eb86ca8c1b9ccacd36813
)
md5sums=(
  f3b103befb66c542569af30ed9734f44
  6295be1fdbae8bb63e189cea18b12ed5
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
