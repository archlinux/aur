# Maintainer: BryanLiang <liangrui.ch@gmail.com>
# Contributor: ryosuke <ryosuke@tutamail.com>

# shellcheck disable=SC2034,SC2154,SC2164

pkgname=fcitx5-pinyin-moegirl
pkgver=20241109
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org wiki"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'CC-BY-NC-SA-3.0')
source=("moegirl-${pkgver}.dict::${url}/releases/download/${pkgver}/moegirl.dict"
        "${url}/raw/master/LICENSE")
sha256sums=('560d4ac7fee6d603442407b76e1c68228817b0d57c234358ca11adf52bea7cce'
            '7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c')

package() {
    install -Dm644 moegirl-${pkgver}.dict "${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/moegirl.dict"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
