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
source=("playbooks.apk::http://www.apkmirror.com/wp-content/themes/APKMirror/download.php?id=11879")
sha256sums=('4345ea1481bd0b9cdfc3d3a1d0417e7c68b482aecda443d027d7589437d7ebe0')

package() {
  cd "$srcdir/assets/fonts"

  # Prepare destination directory
  install -dm755 "$pkgdir/usr/share/fonts/OTF"

  # Install fonts
  install -m644 literata*.otf "$pkgdir/usr/share/fonts/OTF"
}
