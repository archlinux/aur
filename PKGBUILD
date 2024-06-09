# Maintainer: BryanLiang <liangrui.ch@gmail.com>
# Contributor: ryosuke <ryosuke@tutamail.com>

pkgname=fcitx5-pinyin-moegirl
pkgver=20240609
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org wiki"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'CC-BY-NC-SA-3.0')
source=("moegirl-${pkgver}.dict::${url}/releases/download/${pkgver}/moegirl.dict"
        "${url}/raw/master/LICENSE")
sha256sums=('757155d2456bf21813d7b266af6f0f8984e210b9bc912fca33bd628075c0ea1b'
            '7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c')

package() {
    install -Dm644 moegirl-${pkgver}.dict ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/moegirl.dict
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
