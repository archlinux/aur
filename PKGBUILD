# Contributor: dongfengweixiao ( dongfengweixiao [at] gmail [dot] com  )

pkgname=ttf-inziu-iosevka
pkgver=1.8.3
pkgrel=1
pkgdesc="A composite of Iosevka, M+ and Source Han Sans. It is fully hinted and optimized for screen display on every device, and every resolution."
arch=('any')
license=('unknown')
url="http://be5invis.github.io/Iosevka/inziu.html"
depends=('fontconfig')
install="inziu-iosevka.install"
source=(http://7xpdnl.dl1.z0.glb.clouddn.com/inziu-iosevka-$pkgver.7z)
md5sums=('dcad6a6719a2209bc7e0757f23a9092e')

package () {
      install -Dm644 ${srcdir}/*.ttc -t "${pkgdir}/usr/share/fonts/ttc"

}
