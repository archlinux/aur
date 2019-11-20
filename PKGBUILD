# Maintainer: Ivan Semkin <ivan AT semkin DOT ru>

pkgname=chromium-extension-autoscroll
pkgver=4.10
pkgrel=1
pkgdesc='Customizable autoscroll support for Chromium'
arch=(any)
url='https://github.com/Pauan/AutoScroll'
license=(MIT)
makedepends=(git)
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install="${pkgname}.install"
source=('git+https://github.com/Pauan/AutoScroll#commit=625c045ddd74debeb480d54cc96f66aeff52fcbf')
sha256sums=('SKIP')

package() {
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -dr --no-preserve=ownership "${srcdir}/AutoScroll/src"/* "${pkgdir}/usr/share/${pkgname}/"
}
