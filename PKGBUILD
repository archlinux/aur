#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-xcpf
pkgver=2015.12.5
pkgrel=1
pkgdesc='Xyne'"'"'s common Pacman functions, for internal use.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-xcpf"
depends=(pyalpm python3)
optdepends=('rsync: Retrieve ABS files via rsync.')
source=(
  http://xyne.archlinux.ca/projects/python3-xcpf/src/python3-xcpf-2015.12.5.tar.xz
  http://xyne.archlinux.ca/projects/python3-xcpf/src/python3-xcpf-2015.12.5.tar.xz.sig
)
sha512sums=(
  03c7399f57d914c74fb8e79be8130e95c94d83f15552ad435e5e4f5eaa47cb8bde3275dd111cdb8f88f41aa08754da35f9ee83344b474407b273e96d7eba21c2
  80af2f538c36832b0f66eab278a227d435d72ea8ee2c52ef2168c4e3e332e39e60ec91dae9b4e06123a6fff0a0f248815f2c9e2e0dce19e5eeef0ceaf54249ad
)
md5sums=(
  277a8084add57cd44becb0bdd2438e15
  ffb82d0f893a10d7ec55e405e29f7428
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
