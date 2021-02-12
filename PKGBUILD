#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=repo-add_and_sign
pkgver=2021.2
pkgrel=1
pkgdesc='Easily create signed Pacman package repositories.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/repo-add_and_sign"
depends=(pyalpm python3 python3-gpg_batch_sign)
source=(
  https://xyne.archlinux.ca/projects/repo-add_and_sign/src/repo-add_and_sign-2021.2.tar.xz
  https://xyne.archlinux.ca/projects/repo-add_and_sign/src/repo-add_and_sign-2021.2.tar.xz.sig
)
sha512sums=(
  ef81619f3527fb362936295d2712ea3e41fc3874c76c7876ebb017f1ac53b191d678f3a51a7a04483785c3aa9a97d3e9fd42281032d5aa0e9d7ff7b8520e0bcd
  ff6d29793567426460fcfc7815a254c0e7451a541ef2a8f4eab893cc128ba4fb5535fce57e6a84ce9e06efe8c2583b7c53c7b1b9a3f014be393ab3a94bf83651
)
md5sums=(
  59e757f62d7f903464349cc0e692c55e
  252cd2e0478a76e540401833759449df
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
