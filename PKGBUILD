#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2020.12
pkgrel=3
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/pbget"
depends=(git pm2ml python3 python3-aur python3-xcgf python3-xcpf)
source=(
  https://xyne.archlinux.ca/projects/pbget/src/pbget-2020.12.tar.xz
  https://xyne.archlinux.ca/projects/pbget/src/pbget-2020.12.tar.xz.sig
)
sha512sums=(
  b59504c9fbb3c8e7af1e623571306438c0cb8e6a2eba117ed0c932f0d59bd7ec6e7daff6d4c4f87c0ca29897db907ff325a25dd8cb44e668c6101c4be4ad1fb6
  b70f9fec50bf8a2651f79d2bff06a4c4c371890316eb2eb972dd15a6ca777cc5f323b50e50ebff53f0903ba5cd4f5399777318819cc82bf7917d328b1d689d53
)
md5sums=(
  aa162fd7bd1acd3a5dac63d4b5828c29
  5c49d9d94ceabe54c2cc112d0ccb44fc
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
