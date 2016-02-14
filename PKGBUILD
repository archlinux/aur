#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=repo-add_and_sign
pkgver=2016.2
pkgrel=1
pkgdesc='Easily create signed Pacman package repositories.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/repo-add_and_sign"
depends=(pyalpm python3 python3-gpg_batch_sign)
source=(
  http://xyne.archlinux.ca/projects/repo-add_and_sign/src/repo-add_and_sign-2016.2.tar.xz
  http://xyne.archlinux.ca/projects/repo-add_and_sign/src/repo-add_and_sign-2016.2.tar.xz.sig
)
sha512sums=(
  169eea7d9ce32415b9c910e915e8ac3fbcb50ffb91b2ebec108054e72708e0f2ee29ececde34a399f35889a14cc8e49e455b1b328ec8d86fa65f456069d60ada
  95c6baa2dedc3d20ad56223307c73c22fc72953bd4b6bbb9c44c9513e3922498aadcd17be67e49e32abca717d065a6ef2ad7c423687bf54278dbb6c1de69aafe
)
md5sums=(
  13689e33a87bbb9f67a9f36c2ffe2f65
  5d5ec6166f11dd00480ab225809d667c
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
