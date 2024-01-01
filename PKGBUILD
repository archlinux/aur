# Maintainer: BryanLiang <liangrui.ch@gmail.com>

pkgname=fcitx5-pinyin-cedict
pkgver=20240101
pkgrel=1
pkgdesc="根据CEDICT生成的词典"
arch=('any')
url="https://github.com/Bryan2333/fcitx5_dicts"
license=('MIT')
source=("${pkgver}-cedict.dict::${url}/releases/download/${pkgver}/cedict.dict"
        "https://raw.githubusercontent.com/Bryan2333/fcitx5_dicts/master/LICENSE")
sha256sums=('9264cc40dd39a5212eadb3a2de9f4d67b89773c4d4f0135111ab63f083a79777'
            '6cf505022ee98d8d7650bbe3ce26904adc1acbb438cd56afc920b9037267ce7f')

package() {
    install -Dm 644 "${pkgver}-cedict.dict" "${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/cedict.dict"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
