# Maintainer: Chris Snell <chris.snell@gmail.com>
# Contributor: Timo Wilken <timo 21 wilken plus aur at gmail dot com>

pkgname=(ttf-inter-ui otf-inter-ui otf-inter-ui-variable)
pkgver=3.11
pkgrel=1
pkgdesc="A font for highly legible text on computer screens"
url="https://rsms.me/inter/"
arch=(any)
license=(custom:"SIL Open Font License")
conflicts=('ttf-interface')

source=("Inter-${pkgver}.zip::https://github.com/rsms/inter/releases/download/v${pkgver}/Inter-${pkgver}.zip")
sha256sums=('45495b2c2c0a64a5de1a87a6cee3226b92b09039cc144534b56247be9b8b0689')

package_ttf-inter-ui() {
    install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
    install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 "Inter (Hinted, for Windows)/"*.ttf
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -t "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE.txt
}

package_otf-inter-ui() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 "Inter/"*.otf
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -t "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE.txt
}

package_otf-inter-ui-variable() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 "Inter V (Variable)/"*.otf
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -t "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE.txt
}


# vim:set ts=2 sw=2 et:
