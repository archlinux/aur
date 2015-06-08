# Maintainer: Jonne Haß <me@mrzyx.de>

pkgname=sublime-url-handler
pkgver=0.0.4
pkgrel=1
pkgdesc="Open subl:// and txmt:// URLs in Sublime Text. Based on http://blog.byscripts.info/2013/02/txmt-protocol-and-sublime-text-2-english.html"
url='http://github.com/MrZYX/PKGBUILDs/tree/master/sublime-url-handler'
arch=('any')
license=('MIT')
depends=('desktop-file-utils')
install=sublime-url-handler.install
source=($pkgname $pkgname.desktop)

package() {
  install -Dm755 $pkgname         "$pkgdir/usr/bin/$pkgname"
  RPM_BUILD_ROOT=$pkgdir desktop-file-install $pkgname.desktop
}

# vim:set ts=2 sw=2 et:
sha256sums=('9ed93088ea896c0595cf5369b443cb4a386935462e23685d136b241478d64de6'
            'cca3fa496ae05bdd5f6c4f4dcc5f63724002489e58c14a58ab0455aa45b06d66')
