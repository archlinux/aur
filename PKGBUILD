#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-xcpf
pkgver=2017.10
pkgrel=1
pkgdesc='Xyne'"'"'s common Pacman functions, for internal use.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/python3-xcpf"
depends=(pyalpm python-xdg python3 python3-memoizedb python3-xcgf)
optdepends=('rsync: Retrieve ABS files via rsync.')
source=(
  https://xyne.archlinux.ca/projects/python3-xcpf/src/python3-xcpf-2017.10.tar.xz
  https://xyne.archlinux.ca/projects/python3-xcpf/src/python3-xcpf-2017.10.tar.xz.sig
)
sha512sums=(
  ed1b5827079333351be387dacd248b239e4faa777eb8a09556f6eae976af40e212c4ccf41231491e88b6a1b3d807465b1a359f3dfa2b948fea6bbbefe4a49571
  cd598bd60561b410da478a4d4027d19efc78d52fbc3a5c43d92ce928938bdc36e9ab4f1caf4e3f6a9536bf88713de603d8e7c730e9bbc46369e4e17e0bedddd6
)
md5sums=(
  9d1837380a1d401a86ae6b994be3a48d
  e9fb77f97827413c6ff14e97b962768a
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
