# Maintainer: BryanLiang <liangrui.ch@gmail.com>
# Contributor: ryosuke <ryosuke@tutamail.com>

# shellcheck disable=SC2034,SC2154,SC2164

pkgname=fcitx5-pinyin-moegirl
pkgver=20260511
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org wiki"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('MIT' 'CC-BY-NC-SA-3.0')
source=("moegirl-${pkgver}.dict::${url}/releases/download/${pkgver}/moegirl.dict"
        "LICENSE")
sha256sums=('1fd499464c19259f4b3038b27d75d99bccc2ab71370a36d208178f8dfd693dde'
            'bd205072137049f94d14a2059a5635f41f29732f515c4b387d2f20c0b425ffd6')

package() {
    install -Dm644 moegirl-${pkgver}.dict "${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/moegirl.dict"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
