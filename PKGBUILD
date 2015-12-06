#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2015.12.6
pkgrel=1
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pbget"
depends=(pm2ml python3 python3-aur python3-xcgf python3-xcpf)
source=(
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2015.12.6.tar.xz
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2015.12.6.tar.xz.sig
)
sha512sums=(
  e1baa69dec2bac08415d018a11a17256dfc444b6d0a90b4a4886375df976a37542325798e241d44e668c1a54a6f926802986fff561a1250241c301eb7b8de19f
  cf7509e64dbe6c8c1123ed065e1411888d0867efc7137717073b8fe23b43ae18b5d3690248f83b186a5d9f26bb9254e943d53ac14460e477e2e5aae88ce59e40
)
md5sums=(
  e77771d8ec37e45f77c7a5e85c238695
  6e73999c8e2e1c48cddcc1aed7053ea9
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
