# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=otf-literata
pkgver=1.00
pkgrel=1
pkgdesc="Google's new typeface for Play Books"
arch=('any')
url="https://play.google.com/store/apps/details?id=com.google.android.apps.books"
license=('unknown')
depends=('fontconfig' 'xorg-font-utils')
source=("playbooks.apk::https://www.apkmirror.com/wp-content/themes/APKMirror/download.php?id=756572")
sha256sums=('d235988f1ff6247bf3a3ae192b1b1599cd751bfeeee88f2235a57b4cb3cb1ae3')

package() {
  cd "$srcdir/assets/fonts"

  # Prepare destination directory
  install -dm755 "$pkgdir/usr/share/fonts/OTF/literata"

  # Install fonts
  install -m644 literata*.otf "$pkgdir/usr/share/fonts/OTF/literata"
}
