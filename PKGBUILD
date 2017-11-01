#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-xcpf
pkgver=2017.11
pkgrel=1
pkgdesc='Xyne'"'"'s common Pacman functions, for internal use.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-xcpf"
depends=(pyalpm python-xdg python3 python3-memoizedb python3-xcgf)
optdepends=('rsync: Retrieve ABS files via rsync.')
source=(
  https://xyne.archlinux.ca/projects/python3-xcpf/src/python3-xcpf-2017.11.tar.xz
  https://xyne.archlinux.ca/projects/python3-xcpf/src/python3-xcpf-2017.11.tar.xz.sig
)
sha512sums=(
  1022b1fbeaa8490849b1eeb48802000f2543689b1462d5c2a87cc254a1c91665bbddb20a67bcf6cbeb6613f6c6293bff9e817ce9f8c9a8629580dbec44cdea9e
  0e3f79f61b3dec8ab4dcbab61c10dd1fd105c5795ccc852c2bffda94c487827c9f71eb8f33d6a64c8c3ff4e20b968c09fb57cf4a4db42d7028cd92965721e956
)
md5sums=(
  62a50ceca2eb03da434c70aa5952ef49
  9ffd2495fe1646e800a3ed8d5e7fc14e
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
