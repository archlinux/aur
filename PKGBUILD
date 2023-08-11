# Maintainer: RangHo Lee <hello@rangho.me>

pkgbase=suit
pkgver=2.0.1
pkgrel=3
pkgname=(
    "otf-${pkgbase}"
    "ttf-${pkgbase}"
    "ttf-${pkgbase}-variable"
    "woff2-${pkgbase}-variable"
    "woff2-${pkgbase}"
)
pkgdesc="A Korean UI body typeface focused on clarity."
url="https://github.com/sunn-us/SUIT"
arch=('any')
license=('OFL')
source=(
    "https://github.com/sunn-us/SUIT/releases/download/v${pkgver}/SUIT-otf.zip"   
    "https://github.com/sunn-us/SUIT/releases/download/v${pkgver}/SUIT-ttf.zip"   
    "https://github.com/sunn-us/SUIT/releases/download/v${pkgver}/SUIT-Variable-ttf.zip"
    "https://github.com/sunn-us/SUIT/releases/download/v${pkgver}/SUIT-Variable-woff2.zip"
    "https://github.com/sunn-us/SUIT/releases/download/v${pkgver}/SUIT-woff2.zip"   
)
sha256sums=(
    "447c85cc0ee71ffa612f38b554615a7257c42c2c7809fdc0fac466e78f26dcc0"
    "5d125dce72c4feed1b5498d52be04c6fc3e672653670c2a916e1e4c65cb2bf1a"
    "cb0f39627c398efa2f2960ac7b2fe67df718e06e0b4efdbf0efa260d3de43c73"
    "98e53f2e66eae64276c73ae3bac770ecd9c6dab924274effaaab02457be0da01"
    "54c9996c056cd676c0c0e598e80d88f47ebf406188d2ac641ef2c8e0a78994e7"
)

package_otf-suit() {
    install -Dm644 *.otf -t "$pkgdir"/usr/share/fonts/OTF
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-suit() {
    install -Dm644 *.ttf -t "$pkgdir"/usr/share/fonts/TTF
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-suit-variable() {
    install -Dm644 *Variable.ttf -t "$pkgdir"/usr/share/fonts/TTF
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_woff2-suit-variable() {
    install -Dm644 *Variable.woff2 -t "$pkgdir"/usr/share/fonts/woff2
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_woff2-suit() {
    install -Dm644 *.woff2 -t "$pkgdir"/usr/share/fonts/WOFF2
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
