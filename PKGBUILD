#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=locale-en_xx
pkgver=2017
pkgrel=1
pkgdesc='A mixed international English locale with ISO and POSIX formats for cosmopolitan coders.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/locale-en_xx"
replaces=(locale-en_XX)
conflicts=(locale-en_XX)
provides=(locale-en_XX)
source=(
  https://xyne.archlinux.ca/projects/locale-en_xx/src/locale-en_xx-2017.tar.xz
  https://xyne.archlinux.ca/projects/locale-en_xx/src/locale-en_xx-2017.tar.xz.sig
)
sha512sums=(
  51d75f351a1be278f457883306de8d18781827a82ad000d0ad0e324fc88c9eaaf0f7d395ee33bdc43a61d47b2318077b0385cf5fbeda3c467b4055d6adb2fd6d
  f14d74ac62d213ff2f442b6cd5bf6b49fc3a535d586b3559fb6a4c95517eba7cd63e7646940b485b33b65f3a60098cb89cf354b919105ed57cdc42686934df0e
)
md5sums=(
  5ee464acb80d129e6fd9a430ee5e92eb
  79c908377ff343e0f0fa83bba3ab50d5
)
install=locale-en_xx.install
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package () {
  cd -- "$srcdir/$pkgname-$pkgver"
  install -Dm644 "en_XX@POSIX" "$pkgdir/usr/share/i18n/locales/en_XX@POSIX"
#   install -Dm755 "en_XX.sh" "$pkgdir/etc/profile.d/en_XX.sh"
}

# vim: set ts=2 sw=2 et:
