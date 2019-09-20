# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=otf-literata
pkgver=1.00
pkgrel=2
_apkm=795620
pkgdesc="Google's default typeface for Play Books. Android distribution."
arch=('any')
url="https://play.google.com/store/apps/details?id=com.google.android.apps.books"
license=('custom:propietary')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-literata')
replaces=('ttf-literata')
source=("playbooks-$_apkm.apk::https://www.apkmirror.com/wp-content/themes/APKMirror/download.php?id=$_apkm")
sha256sums=('93a4ed336a9c433ec176b73d16c65a6448eb5db63b9924f225ab62ec62280ddf')

package() {
  cd "$srcdir/assets/fonts"

  install -dm755 "$pkgdir/usr/share/fonts/OTF/literata"

  install -m644 literata*.otf "$pkgdir/usr/share/fonts/OTF/literata"
}
