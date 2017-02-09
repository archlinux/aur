# Maintainer: ouyangjun( oyj805557641@gmail.com)
# Contributor: dongfengweixiao ( dongfengweixiao [at] hotmail [dot] com  )

pkgname=ttf-inziu-iosevka
pkgver=1.11.0
pkgrel=1
pkgdesc="A composite of Iosevka, M+ and Source Han Sans. It is fully hinted and optimized for screen display on every device, and every resolution."
arch=('any')
license=('custom:OFL')
url="http://be5invis.github.io/Iosevka/inziu.html"
depends=('fontconfig')
install="inziu-iosevka.install"
source=(http://7xpdnl.dl1.z0.glb.clouddn.com/inziu-iosevka-$pkgver.7z
        'https://raw.githubusercontent.com/be5invis/Iosevka/master/LICENSE.md')
md5sums=('fe49caa42fc337f74f82ad6321b1788b'
         'b640361b29fdcbfb32ced03c7a095460')

package () {
      install -Dm644 ${srcdir}/*.ttc -t "${pkgdir}/usr/share/fonts/ttc"
      install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
