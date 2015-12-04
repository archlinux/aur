#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2015.12.4
pkgrel=1
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pbget"
depends=(python3 python3-xcpf python3-aur)
source=(
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2015.12.4.tar.xz
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2015.12.4.tar.xz.sig
)
sha512sums=(
  b82f783d43dfc3bad57b491133bf10353cc3a91bcc2d335813934dae52dc8debca3b5153880f91a19af7e5bc7464682c8bc725f2cddf1af7fe1828fc5874a72a
  3102d250020fe8c517f0b9e6a78c384927fee065c5797e982e0d0b7e7c65faf19c50ba2464fce025366c0c17b126a5c3ea4fd3d77d827f86d6e0c0e15ad084a7
)
md5sums=(
  3d808395a2a79abd2a9692263597254f
  4e2d4b52e0bcb2a23b1ff6a60051ac97
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
