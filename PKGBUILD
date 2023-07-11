# Maintainer: sataa
pkgname=grub-esp
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple wrapper around grub-install to install GRUB updates to the ESP"
arch=('x86_64')
url='https://git.sr.ht/~sataa/grub-esp'
license=('MIT')
depends=('grub')
source=( 'grub-esp' )
sha512sums=('f57bd84f9274bd4dd017f3a34350338cb26b2f67acc8f433c1cfc3098fb1a5ed28028b8f60d2dabfbec50fcfe5662d6125264b64d0e9f72e1ee59b5a6305cd79')

package() {
  install -Dm 755 "$srcdir/grub-esp" "$pkgdir/usr/bin/grub-esp"
}
