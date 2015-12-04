#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-xcpf
pkgver=2015.12.4.1
pkgrel=1
pkgdesc='Xyne'"'"'s common Pacman functions, for internal use.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-xcpf"
depends=(python3 pyalpm)
optdepends=('rsync: Retrieve ABS files via rsync.')
source=(
  http://xyne.archlinux.ca/projects/python3-xcpf/src/python3-xcpf-2015.12.4.1.tar.xz
  http://xyne.archlinux.ca/projects/python3-xcpf/src/python3-xcpf-2015.12.4.1.tar.xz.sig
)
sha512sums=(
  730766096065e6219a0e6e00fd02ec1e972272768149fa588cb7445a5fc5e038d856acc0474ee7b453e71bfe6536157eaf8dc04a7d26461bf5b2ee4e0b9e63f4
  4d361150680ea2629747ec4e5fdf57b843357d543e0123726fda560968dce8aa505066969bee80b6a1c7acc45cd60fae9109d71d5d8ee87d0eda84cfbd1062d9
)
md5sums=(
  804e2e4cfd78f1cb1fadf0a1821fd0b5
  ef96fbe7ac3a00a3f37cee752618dccb
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
