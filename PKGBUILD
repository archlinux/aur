# Maintainer: esoterica <ethermagicka at proton dot me>

pkgname=ttf-azuki-font
pkgver=1.21
pkgrel=2
pkgdesc="A handwritten font, includes custom emojis"
arch=('any')
url='http://azukifont.com/font/azuki.html'
license=('custom')
source=(http://azukifont.com/font/azukifont121.zip
        'LICENSE')
sha256sums=('4d6363e21e69327756688dbd1aebef12435c09b9e79581aee7a79c1ec486830d'
            '2e68b7b2866a1f297d7a5fd47e74450450b2dbbc35ce12b65aced2b2aae8120c')

package() {
  install -Dm644 azukifont121/*.ttf -t "$pkgdir"/usr/share/fonts/TTF
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
