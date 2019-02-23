# Maintainer: Kadu Diógenes <kadu@fnix.com.br>

pkgname=subl3-url-handler
pkgver=0.0.1
pkgrel=1
pkgdesc="Open subl:// in Sublime Text 3. Based on https://github.com/jhass/PKGBUILDs/tree/master/sublime-url-handler"
url='http://github.com/MrZYX/PKGBUILDs/tree/master/sublime-url-handler'
arch=('any')
license=('MIT')
depends=('desktop-file-utils')
install=subl3-url-handler.install
source=($pkgname $pkgname.desktop)

package() {
  install -Dm755 $pkgname         "$pkgdir/usr/bin/$pkgname"
  RPM_BUILD_ROOT=$pkgdir desktop-file-install $pkgname.desktop
}

# vim:set ts=2 sw=2 et:
sha256sums=('c89b1e9da3b175fc5d6e7f952d957da116fa3733645e17bccc0fa83f67f0232d'
            'aeb867fbd2c10466dcc62f69a66e38100685f78993283e63a56516fc7a7e54d7')
