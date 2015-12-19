#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-xcpf
pkgver=2015.12.19.1
pkgrel=1
pkgdesc='Xyne'"'"'s common Pacman functions, for internal use.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-xcpf"
depends=(pyalpm python3 python3-xcgf)
optdepends=('python3-memoizedb: Temporarily cache package information.' 'rsync: Retrieve ABS files via rsync.')
source=(
  http://xyne.archlinux.ca/projects/python3-xcpf/src/python3-xcpf-2015.12.19.1.tar.xz
  http://xyne.archlinux.ca/projects/python3-xcpf/src/python3-xcpf-2015.12.19.1.tar.xz.sig
)
sha512sums=(
  453e803bc03454ea9da3440f9e34d51dc937a719b4180ad5d4665f32ac9720df417692a40a7c85c972be292b93ed801699f1a236f52743f740e25dc979d1dc85
  9c3d6ec1c2ae948279f29f94586b132b1a2107930c852322db23cc7b7162a5bba9fefd6b1e566b3d058c0bc850f8195c318f8dd6c558a485c9edbd6f6966334b
)
md5sums=(
  654c9664fa018e681f2c501181f3a640
  d31ad3630a86f58b7c99fb9dea90a5bf
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
