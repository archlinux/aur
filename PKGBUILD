# Maintainer: BryanLiang <liangrui.ch@gmail.com>
# Contributor: ryosuke <ryosuke@tutamail.com>

# shellcheck disable=SC2034,SC2154,SC2164

pkgname=fcitx5-pinyin-moegirl
pkgver=20250711
pkgrel=2
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org wiki"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('MIT' 'CC-BY-NC-SA-3.0')
source=("moegirl-${pkgver}.dict::${url}/releases/download/${pkgver}/moegirl.dict"
        "LICENSE")
sha256sums=('923760b2ae67fbbae33c1ad73a3adbd77f892cf2de5cd405bfdba1978352b333'
            'bd205072137049f94d14a2059a5635f41f29732f515c4b387d2f20c0b425ffd6')

package() {
    install -Dm644 moegirl-${pkgver}.dict "${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/moegirl.dict"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
