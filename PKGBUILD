#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2021
pkgrel=1
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/pbget"
depends=(git pm2ml python3 python3-aur python3-xcgf python3-xcpf)
source=(
  https://xyne.archlinux.ca/projects/pbget/src/pbget-2021.tar.xz
  https://xyne.archlinux.ca/projects/pbget/src/pbget-2021.tar.xz.sig
)
sha512sums=(
  8c835d3791ec887c486528972649fd36e4ca8d1eef0944082ef8788113933734146d6cc3533a6008d5efe0505cd8d535c25b3e7717a8b1df91989f0b50cae69b
  ec19d4e8714b81eb8d080a8926a080f16b16d8cd53ac3951aeca49fb2ac01e4dde453daa02b1d58fc767b25f7e2bf24e5e91465a3b0616ab24669b773a7ce5c3
)
md5sums=(
  84ab036581bdab6fab82004f00c7862a
  d80edd55a0860e84a8d4c2007a2d3bb4
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
