#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=repo-add_and_sign
pkgver=2021.7
pkgrel=1
pkgdesc='Easily create signed Pacman package repositories.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/repo-add_and_sign"
depends=(pyalpm python3 python3-gpg_batch_sign)
source=(
  https://xyne.archlinux.ca/projects/repo-add_and_sign/src/repo-add_and_sign-2021.7.tar.xz
  https://xyne.archlinux.ca/projects/repo-add_and_sign/src/repo-add_and_sign-2021.7.tar.xz.sig
)
sha512sums=(
  e4228e0925effb1c82d371bec6bf3fe955b9c122921a23858d42118d374d49c092938585e233f07a3cc36beb8de39e99b6ac21fe632e60f550c830b1b5371563
  1fab23e37147274d0bdfc1c5d8a96f4b2ddfb41df8122981147ce74ba67765f52a73c51dc86a112af21e73d6c8fa9a081134c38777a8db18cb74f2bbd32bf18f
)
md5sums=(
  13cb8cc330db8f1735f7c7d86e05c348
  fd57e524b94ae77b160edb9364d442c0
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
