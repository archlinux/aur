# Maintainer: kiwiyou <kiwiyou.dev@gmail.com>

pkgbase=pretendard
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}")
pkgver=1.2.1
pkgrel=1
pkgdesc="A cross-platform multilingual sans-serif font mainly for Korean support"
url="https://github.com/orioncactus/pretendard"
arch=('any')
license=('OFL')
source=("https://github.com/orioncactus/pretendard/releases/download/v${pkgver}/Pretendard-${pkgver}.zip")
sha256sums=('3e54c46625112213e1bbf1420ba5c2e1e67f91891ea13a38ef00370a3e8941c8')

package_otf-pretendard() {
    install -Dm644 public/static/*.otf -t "$pkgdir"/usr/share/fonts/OTF
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-pretendard() {
    install -Dm644 public/static/alternative/*.ttf -t "$pkgdir"/usr/share/fonts/TTF
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

