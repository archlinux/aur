# Maintainer: kiwiyou <kiwiyou.dev@gmail.com>

pkgbase=pretendard-jp
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}")
pkgver=1.3.9
pkgrel=1
pkgdesc="A cross-platform multilingual sans-serif font mainly for Japanese support"
url="https://github.com/orioncactus/pretendard"
arch=('any')
license=('OFL')
source=("https://github.com/orioncactus/pretendard/releases/download/v${pkgver}/PretendardJP-${pkgver}.zip")
sha256sums=('8dab678c371a1530106ca643b76b2b80d47653d5ba670b01265b48e4c6615d63')

package_otf-pretendard-jp() {
    install -Dm644 public/static/*.otf -t "$pkgdir"/usr/share/fonts/OTF
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-pretendard-jp() {
    install -Dm644 public/static/alternative/*.ttf -t "$pkgdir"/usr/share/fonts/TTF
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
