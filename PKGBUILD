# Maintainer: BryanLiang <liangrui.ch@gmail.com>

pkgname=fcitx5-pinyin-cedict
pkgver=20231201
pkgrel=1
pkgdesc="根据CEDICT生成的词典"
arch=('any')
url="https://github.com/Bryan2333/fcitx5_dicts"
license=('MIT')
source=("${pkgver}-cedict.dict::${url}/releases/download/${pkgver}/cedict.dict"
        "https://raw.githubusercontent.com/Bryan2333/fcitx5_dicts/master/LICENSE")
sha256sums=('d1acd32628cdec458cf7d7775a1b85c865d5afdf3d7bf61e5fce530f5943ae15'
            '6cf505022ee98d8d7650bbe3ce26904adc1acbb438cd56afc920b9037267ce7f')

package() {
    install -Dm 644 "${pkgver}-cedict.dict" "${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/cedict.dict"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
