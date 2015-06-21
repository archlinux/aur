#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=locale-en_xx
pkgver=2015
pkgrel=1
pkgdesc='A mixed international English locale with ISO and POSIX formats for cosmopolitan coders.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/locale-en_xx"
replaces=(locale-en_XX)
conflicts=(locale-en_XX)
provides=(locale-en_XX)
source=(
  http://xyne.archlinux.ca/projects/locale-en_xx/src/locale-en_xx-2015.tar.xz
  http://xyne.archlinux.ca/projects/locale-en_xx/src/locale-en_xx-2015.tar.xz.sig
)
sha512sums=(
  0d5d1eb09b608b17c89a0cbfd3a210fb43f0aa237392ad9e434fada470475169c6400968a32910086e992e505b313c03fec6af3b9c77490175042c8ff2b5a428
  27e6174afce0d5ca8a375325de575eed50297122fbe5227fa929a5d888aa6c205d1eb532f6628bb81f6dd2e4f0282238a34ed27ee2eba19b1a889e1601dc1297
)
md5sums=(
  9a2dc35020c9d33362e9ee74510f4fd3
  5b33ce8648ef4bf785ce937de84a1d05
)
install=locale-en_xx.install
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package () {
  cd -- "$srcdir/$pkgname-$pkgver"
  install -Dm644 "en_XX@POSIX" "$pkgdir/usr/share/i18n/locales/en_XX@POSIX"
#   install -Dm755 "en_XX.sh" "$pkgdir/etc/profile.d/en_XX.sh"
}

# vim: set ts=2 sw=2 et:
