# Maintainer: Vasili Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=ttf-symbola-free
pkgdesc='font with grayscale emoji, older free version'
license=('CC0-1.0' 'Public Domain')
pkgver=9.00
pkgrel=1
arch=('any')

conflicts=('ttf-symbola-ib')
conflicts=('ttf-symbola')
provides=('ttf-symbola')

url='https://fontlibrary.org/en/font/symbola'
source=("${pkgname}-${pkgver}.ttf::https://fontlibrary.org/assets/fonts/symbola/cf81aeb303c13ce765877d31571dc5c7/3f379d2c4d719c3c76736f0990fcaee8/SymbolaRegular.ttf")
sha512sums=('4d9d8a59f40f17d96c76e12fdd684b7e9bee39890a1caf6e9389ce3fba3ccf93adb0ef2ecbecc6bca1671218240d371075b82eed098aaeecea2edf50afa45725')

package() {
  install -Dm644 "${pkgname}-${pkgver}.ttf" "$pkgdir/usr/share/fonts/TTF/Symbola.ttf"
}


# You can read about the newer non-free version here:
#   http://users.teilar.gr/~g1951d/
#   https://bugs.archlinux.org/task/58886

