# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=otf-literata
pkgver=1.00
pkgrel=3
pkgdesc="Google's default typeface for Play Books. Android distribution."
arch=('any')
url="https://play.google.com/store/apps/details?id=com.google.android.apps.books"
license=('custom:propietary')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-literata')
replaces=('ttf-literata')
source=("https://r-static-assets.androidapks.com/rdata/911f40ff46d33f27cdcd032783af4618/com.google.android.apps.books_v5.6.9_RC05.285049181-92871_Android-4.1.apk")
sha256sums=('6e07ee083989026adab80d1248fffeac7d0d3f46da039bc6028fd3218e766121')

package() {
  cd "$srcdir/assets/fonts"

  install -dm755 "$pkgdir/usr/share/fonts/OTF/literata"

  install -m644 literata*.otf "$pkgdir/usr/share/fonts/OTF/literata"
}
