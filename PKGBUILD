#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=locale-en_xx
pkgver=2017
pkgrel=4
pkgdesc='A mixed international English locale with ISO and POSIX formats for cosmopolitan coders.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/locale-en_xx"
source=(
  https://xyne.dev/projects/locale-en_xx/src/locale-en_xx-2017.tar.xz
  https://xyne.dev/projects/locale-en_xx/src/locale-en_xx-2017.tar.xz.sig
)
sha512sums=(
  51d75f351a1be278f457883306de8d18781827a82ad000d0ad0e324fc88c9eaaf0f7d395ee33bdc43a61d47b2318077b0385cf5fbeda3c467b4055d6adb2fd6d
  1658d55168c8176e75901a0464664d642a577c72c1b36ff771e5d342a961ad3e7e743faa950faf6172cdc978e99b785fdcad839f7e818106ecb6e28176a0af64
)
md5sums=(
  5ee464acb80d129e6fd9a430ee5e92eb
  72d594aba65146d1726727b5f9c04dfa
)
install=locale-en_xx.install
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package () {
  cd -- "$srcdir/$pkgname-$pkgver"
  install -Dm644 "en_XX@POSIX" "$pkgdir/usr/share/i18n/locales/en_XX@POSIX"
#   install -Dm755 "en_XX.sh" "$pkgdir/etc/profile.d/en_XX.sh"
}

# vim: set ts=2 sw=2 et:
