# Maintainer: kiwiyou <kiwiyou.dev@gmail.com>

pkgbase=pretendard
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}")
pkgver=1.3.0
pkgrel=1
pkgdesc="A cross-platform multilingual sans-serif font mainly for Korean support"
url="https://github.com/orioncactus/pretendard"
arch=('any')
license=('OFL')
source=("https://github.com/orioncactus/pretendard/releases/download/v${pkgver}/Pretendard-${pkgver}.zip")
sha256sums=('c27e66f9697603c3f3e60eed88d93bd0150e8d6832a8e80a1c26c0c7b9f2752d')

package_otf-pretendard() {
    install -Dm644 public/static/*.otf -t "$pkgdir"/usr/share/fonts/OTF
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-pretendard() {
    install -Dm644 public/static/alternative/*.ttf -t "$pkgdir"/usr/share/fonts/TTF
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

