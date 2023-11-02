# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/toropisco>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=otf-literata
pkgver=2.00
pkgrel=3
pkgdesc="Google's contemporary serif typeface family for long-form reading; default typeface for Play Books. Android distribution."
arch=('any')
url="https://play.google.com/store/apps/details?id=com.google.android.apps.books"
license=('custom:propietary')
makedepends=('git')
replaces=('ttf-literata' 'ttf-literata-opticals' 'ttf-literata-webfonts' 'ttf-literata-webfonts-opticals')
#
# If this doesn't work, please let me know. I may need to find an alternative solution.
#
source=(otf-literata::git+https://gitlab.com/vorbote/lit)

b2sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"

  install -dm755 "$pkgdir/usr/share/fonts/OTF"

  install -m644 lit*.otf "$pkgdir/usr/share/fonts/OTF"
}
