# Maintainer: Chris Snell <chris.snell@gmail.com>

pkgname=ttf-inter-ui
pkgver=2.3
pkgrel=17
pkgdesc="A font for highly legible text on computer screens"
url="https://rsms.me/inter/"
arch=(any)
license=(custom:"SIL Open Font License")
conflicts=('ttf-interface')

source=("Inter-UI-${pkgver}.zip::https://github.com/rsms/inter/releases/download/v${pkgver}/Inter-UI-${pkgver}.zip")
sha256sums=('fdf9c0c0641f1ba2d71a92dcb5d580c0ebd251fe5bfb57d78757fd21c6f237fd')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 "Inter UI (TTF hinted)/"*.ttf
  install -d "$pkgdir/usr/share/licenses/${pkgname}"
  install -t "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.txt
}

# vim:set ts=2 sw=2 et:
