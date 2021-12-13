#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2021.11
pkgrel=2
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/pbget"
depends=(git pm2ml python3 python3-aur python3-xcgf python3-xcpf)
source=(
  https://xyne.dev/projects/pbget/src/pbget-2021.11.tar.xz
  https://xyne.dev/projects/pbget/src/pbget-2021.11.tar.xz.sig
)
sha512sums=(
  d99c8d16f60bd79c48656fb13d0429fd46e0707d7570fe74867e3906b55b69d8af66936e89700df37cdc4529f0efa072a7dda9718d9686de13f1f8b66fb728c4
  1cd0b96e0dcfb24687e91167b29c4ec93f3086dea2940a388da04df4f0ba9340ff9a2c7ec027a671b7c63b35ce12b667fe901bc527e74720f8936a5e3a8aa356
)
md5sums=(
  3cb4850272c4337d148bbc79b0ebb2a2
  aa01ee2c2817b9343a5a123559559572
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
