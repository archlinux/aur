#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=tex2png
pkgver=2014.12.28
pkgrel=5
pkgdesc='Convert TeX and LaTeX to PNG images.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/tex2png"
depends=(texlive-bin texlive-latexextra)
source=(
  https://xyne.dev/projects/tex2png/src/tex2png-2014.12.28.tar.xz
  https://xyne.dev/projects/tex2png/src/tex2png-2014.12.28.tar.xz.sig
)
sha512sums=(
  80c823dd1dc214ec75a13b6771a3a8c20be492c33c33c15a6afcce018fa7481114a9bf90dc093a92f2492975d3fdd57ba308dc556f08060fdd2748d206f399af
  17ddd847780d95c506e8c1fd1b16be2994f7f75bf04b2c50a67f872ed9608f404e64e3ea7c70800a68595ef8f94fa8f2343d9ee065455400ddf3fcf85a6c5eda
)
md5sums=(
  67447ccdf30cbb97adba9175e4c7043c
  cfcdd2884b125407f87d20652a2fcbaa
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
