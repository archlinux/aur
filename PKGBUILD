#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=repo-add_and_sign
pkgver=2021.11.12
pkgrel=1
pkgdesc='Easily create signed Pacman package repositories.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/repo-add_and_sign"
depends=(pyalpm python3 python3-gpg_batch_sign)
source=(
  https://xyne.archlinux.ca/projects/repo-add_and_sign/src/repo-add_and_sign-2021.11.12.tar.xz
  https://xyne.archlinux.ca/projects/repo-add_and_sign/src/repo-add_and_sign-2021.11.12.tar.xz.sig
)
sha512sums=(
  f2d9b9e6158fb30dc1b48911ae181483f9b3d4aeef26eea047cbc7ccb4cf8f670e817a3908ac905da20345a7b599089d6f10a4fabaa8043186d665d77afecf27
  af873ac565eb276a717e46be0449696e818adfa1af16eb14bf962939748ae2b5fd1dfaac4e5e7505a46241635dd2535b38def6d2750999e4787244218de528fb
)
md5sums=(
  e8ed6f559071ef28beedc1a7ebfd65e5
  9d87c3ae2af511a37795e46b4509b9eb
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
