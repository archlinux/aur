# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/toropisco>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=otf-literata
pkgver=2.00
pkgrel=6
pkgdesc="Google's contemporary serif typeface family for long-form reading; default typeface for Play Books. Android distribution."
arch=('any')
url="https://play.google.com/store/apps/details?id=com.google.android.apps.books"
license=('custom:propietary')
makedepends=('git')
conflicts=('ttf-literata' 'ttf-literata-opticals')
provides=('ttf-literata' 'ttf-literata-opticals')
replaces=('ttf-literata' 'ttf-literata-opticals')
#
# Obtain a copy of the "Google Play Books & Audiobooks" and extract the fonts. Place them in the same
# directory as this PKGBUILD.
#


package() {
  cd "$startdir"

  install -dm755 "$pkgdir/usr/share/fonts/OTF"
  install -m644 lit*.otf "$pkgdir/usr/share/fonts/OTF"
}
