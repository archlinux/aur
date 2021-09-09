# Maintainer: kiwiyou <kiwiyou.dev@gmail.com>

pkgbase=pretendard
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}")
pkgver=1.1.1
pkgrel=1
pkgdesc="A cross-platform multilingual sans-serif font mainly for Korean support"
url="https://github.com/orioncactus/pretendard"
arch=('any')
license=('OFL')
source=("https://github.com/orioncactus/pretendard/releases/download/v${pkgver}/Pretendard-${pkgver}.zip")
sha256sums=('9a7c0df1e5c8e17836005776263fc6770ff1da5f85e7a653222a24d95daf8844')

package_otf-pretendard() {
    install -Dm644 public/static/*.otf -t "$pkgdir"/usr/share/fonts/OTF
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-pretendard() {
    install -Dm644 public/static/alternative/*.ttf -t "$pkgdir"/usr/share/fonts/TTF
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

