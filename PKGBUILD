# Maintainer: BryanLiang <liangrui.ch@gmail.com>

pkgname=fcitx5-pinyin-cedict
pkgver=20240201
pkgrel=1
pkgdesc="根据CEDICT生成的词典"
arch=('any')
url="https://github.com/Bryan2333/fcitx5_dicts"
license=('MIT')
source=("${pkgver}-cedict.dict::${url}/releases/download/${pkgver}/cedict.dict"
        "https://raw.githubusercontent.com/Bryan2333/fcitx5_dicts/master/LICENSE")
sha256sums=('ae0519611773b7e4120e8eb0876acb778a9f6d6ca4958ea9e599e02e18aceef8'
            '6cf505022ee98d8d7650bbe3ce26904adc1acbb438cd56afc920b9037267ce7f')

package() {
    install -Dm 644 "${pkgver}-cedict.dict" "${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/cedict.dict"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
