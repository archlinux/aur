# Maintainer: kiwiyou <kiwiyou.dev@gmail.com>

pkgbase=pretendard
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}")
pkgver=1.3.7
pkgrel=1
pkgdesc="A cross-platform multilingual sans-serif font mainly for Korean support"
url="https://github.com/orioncactus/pretendard"
arch=('any')
license=('OFL')
source=("https://github.com/orioncactus/pretendard/releases/download/v${pkgver}/Pretendard-${pkgver}.zip")
sha256sums=('45bff761e1a1c26d96107c39207f2d910ec417aef41ffb6ef3d2681bd321cb9b')

package_otf-pretendard() {
    install -Dm644 public/static/*.otf -t "$pkgdir"/usr/share/fonts/OTF
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-pretendard() {
    install -Dm644 public/static/alternative/*.ttf -t "$pkgdir"/usr/share/fonts/TTF
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
