# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-classic-fonts
pkgver=1.0.0
pkgrel=1
pkgdesc="Adobe Source Han Fonts with Classic Style Chinese Character"
arch=('any')
url="https://github.com/adobe-fonts/"
license=('OFL')
source=(
    'https://github.com/redchenjs/source-han-serif-classic/raw/master/OTC/SourceHanSerifC.otc'
    'https://github.com/redchenjs/source-han-sans-classic/raw/master/OTC/SourceHanSansC.otc'
    'https://github.com/redchenjs/source-han-mono-classic/raw/master/OTC/SourceHanMonoC.otc'
)
md5sums=(
    '9ae3d2c20547a0ce31bdbf7d938075d7'
    '92d6b46fb5133569ccf3c7bf7d6c6b1d'
    'e8e38cd189bc3f4fcce8306fd5f0492b'
)

package() {
    install -Dm644 "${srcdir}"/SourceHanSerifC.otc \
                   "${pkgdir}"/usr/share/fonts/adobe-source-han-classic/SourceHanSerifC.otc
    install -Dm644 "${srcdir}"/SourceHanSansC.otc \
                   "${pkgdir}"/usr/share/fonts/adobe-source-han-classic/SourceHanSansC.otc
    install -Dm644 "${srcdir}"/SourceHanMonoC.otc \
                   "${pkgdir}"/usr/share/fonts/adobe-source-han-classic/SourceHanMonoC.otc
}
