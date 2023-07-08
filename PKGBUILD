# Maintainer: kiwiyou <kiwiyou.dev@gmail.com>

pkgbase=pretendard
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}")
pkgver=1.3.8
pkgrel=1
pkgdesc="A cross-platform multilingual sans-serif font mainly for Korean support"
url="https://github.com/orioncactus/pretendard"
arch=('any')
license=('OFL')
source=("https://github.com/orioncactus/pretendard/releases/download/v${pkgver}/Pretendard-${pkgver}.zip")
sha256sums=('394c4938044f6526da6e724caf15c0da9f3452a35694b9a946df5afca7ee0a56')

package_otf-pretendard() {
    install -Dm644 public/static/*.otf -t "$pkgdir"/usr/share/fonts/OTF
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-pretendard() {
    install -Dm644 public/static/alternative/*.ttf -t "$pkgdir"/usr/share/fonts/TTF
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
