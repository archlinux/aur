#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pacnew_scripts
pkgver=2012.12
pkgrel=2
pkgdesc='A collection of scripts to help merge changes in .pacnew files.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pacnew_scripts"
depends=(perl)
source=(
  http://xyne.archlinux.ca/projects/pacnew_scripts/src/pacnew_scripts-2012.12.tar.xz
  http://xyne.archlinux.ca/projects/pacnew_scripts/src/pacnew_scripts-2012.12.tar.xz.sig
)
sha512sums=(
  5bc4b63ded01da212297343a023c5fd00264246e0cfaa48b9529a8dbac7f54e354248b3d7c8cd6be08a02161a220cd6287a3e94e3385c16edf2b3326623266f1
  ca43e498de2d02b5add368f5861086d54bd5f30f63009106430da9083ffb3aeb090dc886fbb333b4a9f58bd8cbc9791efb94043c809108c2af44c107be42b352
)
md5sums=(
  420f3b13f46810f223b82ebcf834b94a
  20c1c8c1a9f532c644d641e1782a4332
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  for _script in "$srcdir/$pkgname-$pkgver/merge_pacnew_"*
  do
    install -Dm755 "$_script" "$pkgdir"/usr/bin/"${_script##*/}"
  done
}


# vim: set ts=2 sw=2 et:
