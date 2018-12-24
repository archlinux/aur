#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=alatools
pkgver=2018.12
pkgrel=1
pkgdesc='Tools for the Arch Linux Archive.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/alatools"
depends=(python3)
source=(
  https://xyne.archlinux.ca/projects/alatools/src/alatools-2018.12.tar.xz
  https://xyne.archlinux.ca/projects/alatools/src/alatools-2018.12.tar.xz.sig
)
sha512sums=(
  568e8bab8e788a278f0c8504ac6f1de22600050e40ea6c92746eb143f39f8eb5eaee9eb20191a42fa87ba20adfbc63de2b405293090b28701b3db96bef76d0d9
  0bfa47120ed1dca33c86fda5e125dfba43277d089d182773a88942c668e344298a2ecad0b3ec8298e050f7851821131679f0914bb002dab39f315d13ca3c5e55
)
md5sums=(
  187d507cbbd4d1ce8c5dd0ae8f66fdb1
  844070ee041c4146678db32e2968c0d0
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  for script_ in "$srcdir/$pkgname-$pkgver/exe/"*
  do
    install -Dm755 "$script_" "$pkgdir/usr/bin/${script_##*/}"
  done
}


# vim: set ts=2 sw=2 et:
