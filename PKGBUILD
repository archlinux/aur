# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/toropisco>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=otf-literata
pkgver=2.00
pkgrel=4
pkgdesc="Google's contemporary serif typeface family for long-form reading; default typeface for Play Books. Android distribution."
arch=('any')
url="https://play.google.com/store/apps/details?id=com.google.android.apps.books"
license=('custom:propietary')
makedepends=('git')
replaces=('ttf-literata' 'ttf-literata-opticals' 'ttf-literata-webfonts' 'ttf-literata-webfonts-opticals')
#
# Obtain a copy of the "Google Play Books & Audiobooks" and extract the fonts. Place them in the same
# directory as this PKGBUILD.
#


package() {
  cd "$startdir"

  install -dm755 "$pkgdir/usr/share/fonts/OTF"
  install -m644 lit*.otf "$pkgdir/usr/share/fonts/OTF"
}
