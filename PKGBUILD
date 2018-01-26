pkgname=ttf-consolas-with-powerline
pkgver=5b42778
pkgrel=1
pkgdesc="Consolas with Powerline"
arch=(any)
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
url="https://github.com/v1v1anb3nson/ttf-consolas-with-powerline"
source=("git+https://github.com/v1v1anb3nson/$pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git rev-parse --short HEAD
}

package() {
  install -Dm644 $srcdir/$pkgname/Consolas-Regular.ttf "$pkgdir"/usr/share/fonts/$pkgname/Consolas-Regular.ttf
  install -Dm644 $srcdir/$pkgname/Consolas-Bold.ttf "$pkgdir"/usr/share/fonts/$pkgname/Consolas-Bold.ttf
  install -Dm644 $srcdir/$pkgname/Consolas-Italic.ttf "$pkgdir"/usr/share/fonts/$pkgname/Consolas-Italic.ttf
  install -Dm644 $srcdir/$pkgname/Consolas-Bold-Italic.ttf "$pkgdir"/usr/share/fonts/$pkgname/Consolas-Bold-Italic.ttf
}
