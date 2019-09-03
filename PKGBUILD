# Maintainer: Chris Snell <chris.snell@gmail.com>
# Contributor: Timo Wilken <timo 21 wilken plus aur at gmail dot com>

pkgname=(ttf-inter-ui otf-inter-ui)
pkgver=3.9
pkgrel=1
pkgdesc="A font for highly legible text on computer screens"
url="https://rsms.me/inter/"
arch=(any)
license=(custom:"SIL Open Font License")
conflicts=('ttf-interface')

source=("Inter-${pkgver}.zip::https://github.com/rsms/inter/releases/download/v${pkgver}/Inter-${pkgver}.zip")
sha256sums=('445f71a2c6d0a64c11649533346ded15eb28c1be97b5866910f786da78ab4dbb')

package_ttf-inter-ui() {
    install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
    install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 "Inter (TTF hinted)/"*.ttf
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -t "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE.txt
}

package_otf-inter-ui() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 "Inter (OTF)/"*.otf
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -t "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE.txt
}

# vim:set ts=2 sw=2 et:
