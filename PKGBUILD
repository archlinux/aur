#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2015
pkgrel=1
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pbget"
depends=(python3)
optdepends=('rsync: ABS tree support' 'python3-aur: AUR support' 'pyalpm: checking upgradable packages')
source=(
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2015.tar.xz
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2015.tar.xz.sig
)
sha512sums=(
  bb6bb0fd686daee30cdba252092d2b9ec991fc5926a0d9111f3020fe293f0969ec7fd24834f1ee588b14eb040fd0b84ef7562a71f0d57cb983be85b8c9aed9a1
  1d36ee34234a7357d55bbf0ce544cc3d4d70b1aa851a1926b00d814b6cddf48a197d8f995d6358d885b3b9804b69d2077a46f018a2e4118a0ec01fb21cfff67d
)
md5sums=(
  7c47bb4391239304875723e7a582a317
  59b875356c57417a1c1e69b869e8b17a
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
