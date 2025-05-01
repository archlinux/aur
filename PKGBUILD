# Maintainer: kiwiyou <kiwiyou.dev@gmail.com>

pkgbase=pretendard-std
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}")
pkgver=1.3.9
pkgrel=2
pkgdesc="A cross-platform multilingual sans-serif font for Latin-based environment"
url="https://github.com/orioncactus/pretendard"
arch=('any')
license=('OFL')
source=("https://github.com/orioncactus/pretendard/releases/download/v${pkgver}/PretendardStd-${pkgver}.zip")
sha256sums=('bde2ecb6aa27fb1d36b729b47b1cad5a890dca8e8a06aebe0727b4c27624ad42')

package_otf-pretendard-std() {
    install -Dm644 public/static/*.otf -t "$pkgdir"/usr/share/fonts/OTF
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-pretendard-std() {
    install -Dm644 public/static/alternative/*.ttf -t "$pkgdir"/usr/share/fonts/TTF
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
