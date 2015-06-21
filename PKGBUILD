#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=repo-add_and_sign
pkgver=2015.5
pkgrel=1
pkgdesc='Easily create signed Pacman package repositories.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/repo-add_and_sign"
depends=(pyalpm python3 python3-gpg_batch_sign)
source=(
  http://xyne.archlinux.ca/projects/repo-add_and_sign/src/repo-add_and_sign-2015.5.tar.xz
  http://xyne.archlinux.ca/projects/repo-add_and_sign/src/repo-add_and_sign-2015.5.tar.xz.sig
)
sha512sums=(
  2573cb5d66cc47ffe1ef58c52850d3b9898c6eed71370093b707697e13609f514ec3e29e3d1186921822d3a915ba44b7aec861c0e670027bdfd5e3f6f65ce25b
  30a8e662dc273f1820cf8e71a4582f5fd661cd78e68f2e5600c3a8a14912c69ea9df8d81e5fe4f3cb97869c828fd7bec7b8495cb3df073351317232aefe22b31
)
md5sums=(
  830f1765744d77137bb5754e236dffc4
  57ee6ca6d05d5ff23e3ea2f7e9e1f036
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
