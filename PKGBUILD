# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=otf-literata
pkgver=1.00
pkgrel=5
pkgdesc="Google's default typeface for Play Books. Android distribution."
arch=('any')
url="https://play.google.com/store/apps/details?id=com.google.android.apps.books"
license=('custom:propietary')
depends=('fontconfig' 'xorg-font-util')
conflicts=('ttf-literata')
replaces=('ttf-literata')
#
# If this doesn't work, please let me know. I may need to find an alternative solution.
#
source=("https://dw51.uptodown.com/dwn/NNTq5NARkhAvzpZFRWJy_qDg0TZXbCd_dxSsXki2lxxlrA5RMMPphu-iNCmGh3qYQIWzWrKEz9NEmE7wMtdRbfMQAoK8sQeP5NE0_cuVg20QJECy6Dt5p2phdK9x7rFI/aPaK75RXUWGvVfZzLLR045pd5tnnABxiXBT4YcBzVXxGNjKVHXmqrUpj1WOKR5utdmNZZQrdmozvE5XxtgseUk_YU7_9mzM_nWsgnnmCDsXmIvITkklP2LLzIbs8Etry/Mc6dny-s3qLobptBQ6v847yj2foAyVpnqobfwV2_yJmMZZ9VeOTgEkct29cLXV2iHYj68pCrqUhowHjImmMiPVBAJEDC_DoZUSln6mxgpc8=/google-play-books-5-9-11-rc11-322191871.apk")
b2sums=('5590a36527a8a34d1c3f60790bec91c18e10aab0b87942569395f91426d513fefdebeb78cb1551ec20d33a3d1f07eeb2a4b4b75d820a28ba1bbee8c36355a392')

package() {
  cd "$srcdir/assets/fonts"

  install -dm755 "$pkgdir/usr/share/fonts/OTF/literata"

  install -m644 literata*.otf "$pkgdir/usr/share/fonts/OTF/literata"
}
