#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2021.7
pkgrel=1
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/pbget"
depends=(git pm2ml python3 python3-aur python3-xcgf python3-xcpf)
source=(
  https://xyne.archlinux.ca/projects/pbget/src/pbget-2021.7.tar.xz
  https://xyne.archlinux.ca/projects/pbget/src/pbget-2021.7.tar.xz.sig
)
sha512sums=(
  4b723393589ddb9291e02a3e4b3482d4c91c748dd2366839d9126239b433fd37a637752616c17feab222e583a8479c9946af004fbda62d44eb602c9f41657b53
  68af137ed2a38642c9eb8c2d8414f24bbc11b3bbf2c9262e7fdb42c54926aca38a570e238b9092e2e0d4c96d5eb8752bb5acfe8194f7e286bce468fa7ec9ad65
)
md5sums=(
  f3dcf4097d801612fab13bd9955c0578
  6c58ea26428370eb677b60c1fd978248
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
