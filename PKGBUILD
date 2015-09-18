pkgname=ttf-font-icons
pkgver=1
pkgrel=1
pkgdesc="A non-overlapping mix of Ionicons and Awesome iconic fonts"
url="https://www.dropbox.com/s/9iysh2i0gadi4ic/icons.pdf"
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
options=("!strip")
arch=('any')
source=('https://www.dropbox.com/s/nypgaun7ckl97ga/icons.ttf')
md5sums=('800c09709d456a127bc9160ec1ecddf6')

package() {
  install -m 644 -D "$srcdir/icons.ttf" "$pkgdir/usr/share/fonts/TTF/icons.ttf"
}
