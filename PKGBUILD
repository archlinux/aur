#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2016
pkgrel=1
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pbget"
depends=(pm2ml python3 python3-aur python3-xcgf python3-xcpf)
source=(
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2016.tar.xz
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2016.tar.xz.sig
)
sha512sums=(
  dc7b05cd1f8ea5fa99390c90a4c9824c8a432c0d4a065a025940a260bfaa29ea1e57b8c13d3d9e4cd62a899288ba5b5ba12ede6ba5545ee12f8b84fd3cd6dc2c
  d9ad9ea56eb3cc4f44fff836b69500b219f41ffe344b19c3bdca5acc1f6ce93c599ce121978c7a723be5119b5edfd1b4897c4aa13838f4ab2c530104544b182c
)
md5sums=(
  0b742edcfcb53f09e5f9f9fb78800578
  b737f9621d93ad58d4a4d311b6c69d57
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
