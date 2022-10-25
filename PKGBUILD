# Maintainer: Yumeoto_Zorin <zorin@zorin.icu>
pkgbase="ttf-lxgw-bright"
pkgname=("ttf-lxgw-bright" "ttf-lxgw-bright-gb" "ttf-lxgw-bright-tc")
pkgver="4.134.3"
pkgrel="1"
pkgdesc="A merged font of Ysabeau and LXGW WenKai."
arch=("any")
url="https://github.com/lxgw/LxgwBright"
license=("OFL")
_raw="https://raw.githubusercontent.com/lxgw/LxgwBright/main"
source=("$_raw/license.txt")
sha256sums=('e564f06d018e7b95bc3594c96a17f1d41865af4038c375e7aa974dd69df38602'
            'ae62231f0aa1667624444ecbe3b10cd9fea7cc977909dc1eb4bf4b4c5962d9b1'
            '4e6dd4682ffdc82704e0cadd1801de33be41c56f520bb59454775ff69567b178'
            'adbc0c4dbde519fae7a2b87160b6bd47fa622b4dd82765d6f33f7cd554a04159'
            '4bfefdd1b855d86d0dc06be78c43f10807432dd420b32cc89733fc374437d913'
            'bf8d17982ad9e23f70e7612796332a23761c35e71bd28f5dce136a8d29cadf2b'
            'd375a05b34ecc56e9dc87156656a19978f60d055d0e15f2fd0cd5e3dbd376488'
            '172eb6b96f17accab8af184571ba58349d8c1a7dc9d0c73049e11ee07a6232fc'
            '2c16fcc8afbbd596a124ad201de32e13ab90fbbd45ab1cdf0061bb957ce24cc0'
            '4d8be943b0f5368b77b7e6879e5ed4d41725b6aaf52a967039d5d49fe00b0a2a'
            '1aaba2dbb393b43089b26eb3bca2577c71870221165405f56a7f54388e9df985'
            '1c872b1cb478628b20ee5a1b53c57ccc77a3aa47e4bfb659cf49967709d77dd2'
            '4d7fc1dfde4442703907761c5a1da6cc1793c57d3473185caee83cf4abfb2608'
            'a211d9c303683fb89da61d427c8fec875a129c47b0915ad3c59826768deb78b3'
            '2ab0e452a97448f2f89d367785fa42bf47ac0f8fc9875956d3335d8bdd8b98bf'
            'b8f6d6d2d5eed82c8b7d9fe8025db909698b8af147ee5dc4163c5351b4e042d9'
            'afa45e1d37b1edd0e11fa2279b37cb331619f21e8054e44742b30735f933023c'
            '0c23a8bef2460f93556e721febc24ae6d5a52dcf95a27ec11cc76dc70f2ecef1'
            'add7bf2cb6153d3aa55cfb49a79f6de7e133474aa3f887f891160f89cac321dc')

_font_families=("LXGWBright" "LXGWBrightGB" "LXGWBrightTC")
_font_weight=(
    "Italic"
    "Medium"
    "MediumItalic"
    "Regular"
    "SemiLight"
    "SemiLightItalic"
)

for _font in "${_font_families[@]}"; do
    for _weight in "${_font_weight[@]}"; do
        source+=("$_raw/$_font/$_font-$_weight.ttf")
    done
done

package_ttf-lxgw-bright() {
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    for _weight in "${_font_weight[@]}"; do
        install -m644 "LXGWBright-$_weight.ttf" "$pkgdir/usr/share/fonts/TTF"
    done
    install -m644 "license.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-lxgw-bright-gb() {
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    for _weight in "${_font_weight[@]}"; do
        install -m644 "LXGWBrightGB-$_weight.ttf" "$pkgdir/usr/share/fonts/TTF"
    done
    install -m644 "license.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-lxgw-bright-tc() {
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    for _weight in "${_font_weight[@]}"; do
        install -m644 "LXGWBrightTC-$_weight.ttf" "$pkgdir/usr/share/fonts/TTF"
    done
    install -m644 "license.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
