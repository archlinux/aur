# Maintainer: kiwiyou <kiwiyou.dev@gmail.com>

pkgbase=pretendard-gov
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}")
pkgver=1.3.9
pkgrel=2
pkgdesc="A cross-platform multilingual sans-serif font mainly for governmental use in South Korea"
url="https://github.com/orioncactus/pretendard"
arch=('any')
license=('OFL')
source=("https://github.com/orioncactus/pretendard/releases/download/v${pkgver}/PretendardGOV-${pkgver}.zip")
sha256sums=('080266d2faa8911b0e239b367405fdbcb2b4e17b22067e40aeb34a6c3fca0ac4')

package_otf-pretendard-gov() {
    install -Dm644 public/static/*.otf -t "$pkgdir"/usr/share/fonts/OTF
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-pretendard-gov() {
    install -Dm644 public/static/alternative/*.ttf -t "$pkgdir"/usr/share/fonts/TTF
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
