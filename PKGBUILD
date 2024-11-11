# Maintainer: Jonne Haß <me@mrzyx.de>
# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=sublime-url-handler
pkgver=0.0.4
pkgrel=3
pkgdesc="Open subl:// and txmt:// URLs in Sublime Text."
url='https://github.com/jhass/PKGBUILDs/tree/main/sublime-url-handler'
arch=('any')
license=('MIT')
depends=('desktop-file-utils')
source=($pkgname $pkgname.desktop)

package() {
  install -Dm755 $pkgname         "$pkgdir/usr/bin/$pkgname"
  desktop-file-install --dir="$pkgdir/usr/share/applications" "$pkgname.desktop"
}

sha256sums=('9ed93088ea896c0595cf5369b443cb4a386935462e23685d136b241478d64de6'
            'cca3fa496ae05bdd5f6c4f4dcc5f63724002489e58c14a58ab0455aa45b06d66')

# vim:set ts=2 sw=2 et:
