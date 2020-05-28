# Maintainer: Philip Sequeira <phsequei at gmail dot com>

pkgname=otf-exo
pkgver=2.0
# This font is sometimes updated but stays at "2.0". It has been updated at
# least twice since 2.0 and the most recent change was with pkgrel 7.
pkgrel=8
pkgdesc='A geometric sans serif font with a technological feel'
arch=('any')
url='https://www.ndiscover.com/exo-2-0/'
license=('OFL')
depends=('fontconfig' 'xorg-mkfontdir')
source=('https://www.ndiscover.com/wp-content/themes/barrel-child/fonts/demo/exo2/Exo2.zip')
md5sums=('4d3f183eb4267dcec715d45c872c2a36')
sha256sums=('646958d276e88ae9d92a7c1e2e026ed956cd0b59b64f34d8b8a102c43e50e48a')

package() {
  install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF" "${srcdir}/Exo 2.0"/*.otf
}
