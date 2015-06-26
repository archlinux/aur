# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=otf-literata
pkgver=1
pkgrel=1
pkgdesc="Google's new typeface for Play Books"
arch=('any')
url="https://play.google.com/store/apps/details?id=com.google.android.apps.books"
license=('unknown')
depends=('fontconfig' 'xorg-font-utils')
install='otf.install'
source=("playbooks.apk::http://www.apkmirror.com/wp-content/themes/APKMirror/download.php?id=12466")
sha256sums=('e9b4ac5372a59fd9fca20452bb9f4c1104732ec627dbad8de4602c9d28dcc4d8')

package() {
  cd "$srcdir/assets/fonts"

  # Prepare destination directory
  install -dm755 "$pkgdir/usr/share/fonts/OTF"

  # Install fonts
  install -m644 literata*.otf "$pkgdir/usr/share/fonts/OTF"
}
