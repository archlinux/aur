# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=iranian-fonts
pkgver=20140118
pkgrel=2
pkgdesc="Iranian-Sans and Iranian-Serif Persian font family."
url="https://fontlibrary.org/en/font/iranian-gui-fonts"
arch=(any)
license=('custom:Bitstream Vera')
depends=('fontconfig')
provides=('ttf-iranian-sans' 'ttf-iranian-serif' "$pkgname")
conflicts=('ttf-iranian-sans' 'ttf-iranian-serif' "$pkgname")
replaces=('ttf-iranian-sans' 'ttf-iranian-serif')
source=("https://fontlibrary.org/assets/downloads/iranian-sans/2619cbcea5e87e4bb3d77b2e2a94466f/iranian-sans.zip"
        "https://fontlibrary.org/assets/downloads/iranian-serif/3bf122e0d984a0a116a95491c835ec49/iranian-serif.zip")
sha256sums=('42ef3465f578f0f595d4ef2c8ed041df1205a4c09d07f832c6d02793752274a7'
            '309cc849ab4a1098018b7a5566c9d4dd40a9e5fee3bf36602e190d8d0d7056cd')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./*.ttf
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
