#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2013.12
pkgrel=1
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pbget"
depends=(python3)
optdepends=('rsync: ABS tree support' 'python3-aur: AUR support' 'pyalpm: checking upgradable packages')
source=(
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2013.12.tar.xz
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2013.12.tar.xz.sig
)
sha512sums=(
  4aa3eb9481e5208dd20d4e07af5699bb177353b04a7b587285c9edfed0df0ca1c6acf8ae12fa1a8db36d15799255d7010b5d9a267cbfe0c072af093ce46eb7f1
  38079e8d871b696cce17991e18180d22383de82acf64169be2077dbe95f27589aef7ace8774e487dff0ae8bdbc4f8a2288c7e820d5fed0d048addb2b0ead7586
)
md5sums=(
  e1dbbaad8ed0788251ee4e0147f5a5d0
  4078e87ea93fcca1c037493816c8b697
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
