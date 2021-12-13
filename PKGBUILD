#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2021.11
pkgrel=3
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/mimeo"
depends=(file python-pyxdg python3)
optdepends=('shared-mime-info: for recognizing more MIME-types')
source=(
  https://xyne.dev/projects/mimeo/src/mimeo-2021.11.tar.xz
  https://xyne.dev/projects/mimeo/src/mimeo-2021.11.tar.xz.sig
)
sha512sums=(
  85843acf42ef92ea1ae86cc7bc6c2291771b42714fbf06da167b7c98b944c0b413199d0c19c29dffd89f12c7ecbe43f96bde7f8da06c7831bb871d47dc35b031
  265490d6b4144218571a5930f89595aec2b5accf50ccdc19141cf762387d31f9ea816443436ca50f39ed4c054e709f8ad172dce92b75e4dad9bb99982c563cd7
)
md5sums=(
  1eaedd2a18289ec48cfe9930d05a5ea4
  d4cd325faabdea59e2f233ce0def704a
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
