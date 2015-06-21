#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=tex2png
pkgver=2014.12.28
pkgrel=1
pkgdesc='Convert TeX and LaTeX to PNG images.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/tex2png"
depends=(texlive-bin)
source=(
  http://xyne.archlinux.ca/projects/tex2png/src/tex2png-2014.12.28.tar.xz
  http://xyne.archlinux.ca/projects/tex2png/src/tex2png-2014.12.28.tar.xz.sig
)
sha512sums=(
  80c823dd1dc214ec75a13b6771a3a8c20be492c33c33c15a6afcce018fa7481114a9bf90dc093a92f2492975d3fdd57ba308dc556f08060fdd2748d206f399af
  218dae1395cbe4d9252c2c515f6a5fbe398496f433b8558e092efd4b002ca1819eac3f63734ff19b48a47ca1038ceaf81b8688495c766342e9e13ea909fe3ddf
)
md5sums=(
  67447ccdf30cbb97adba9175e4c7043c
  5aa8cbc3d3aacb22b490cc47db100081
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
