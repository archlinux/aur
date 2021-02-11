#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=repo-add_and_sign
pkgver=2021.1
pkgrel=1
pkgdesc='Easily create signed Pacman package repositories.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/repo-add_and_sign"
depends=(pyalpm python3 python3-gpg_batch_sign)
source=(
  https://xyne.archlinux.ca/projects/repo-add_and_sign/src/repo-add_and_sign-2021.1.tar.xz
  https://xyne.archlinux.ca/projects/repo-add_and_sign/src/repo-add_and_sign-2021.1.tar.xz.sig
)
sha512sums=(
  1de80ee52968dbf428ddd833ba33834540afef821501d5f5196925e00fa46169b3892893f2abb2a807f94352c40d8372ead2cbea332e11a347d01f4de5d0a411
  04b3e3e4c3161d2b4db99a68dbf9fe3a933fab6e19560bb9a814b663bc6b6115cee9dbab9c7344f92440178f6f14914971d1ff4f91521ec4648c5cc731d1db52
)
md5sums=(
  24069696ec84d5eb068726c3fa9a7a64
  d7c2e44727711696d5ddedd13df1f3f4
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
