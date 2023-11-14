# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: H. Rosendahl <h at ro dot sendahl dot de>

pkgname=otf-jost
pkgver=3.5
pkgrel=1
pkgdesc='A sans-serif font by indestructible type* inspired by 1920s German sans-serifs'
arch=(any)
url=https://indestructibletype.com/Jost
license=(OFL)

source=(Jost-${pkgver}.zip::https://github.com/indestructible-type/Jost/releases/download/$pkgver/Jost.zip)
sha256sums=(1030acfb33af22e9bbd2217706c76da87a94c41c58a8ec6d61e785696b1469d9)

package() {
    cd "$srcdir"/Jost-master
    install -Dm644 -t "$pkgdir"/usr/share/fonts/jost fonts/otf/*.otf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.md
}
