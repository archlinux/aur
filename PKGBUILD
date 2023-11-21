# Maintainer: BryanLiang <liangrui.ch@gmail.com>

pkgname=fcitx5-pinyin-cedict
pkgver=20231101
pkgrel=2
pkgdesc="根据CEDICT生成的词典"
arch=('any')
url="https://github.com/Bryan2333/fcitx5_dicts"
license=('MIT')
source=("${url}/releases/download/${pkgver}/cedict.dict"
        "https://raw.githubusercontent.com/Bryan2333/fcitx5_dicts/master/LICENSE")
sha256sums=('c56dfbe739819eaf96fd4815014ba5c0b29132d854181cffded0e6f9db647fbe'
            '6cf505022ee98d8d7650bbe3ce26904adc1acbb438cd56afc920b9037267ce7f')

package() {
    install -Dm 644 cedict.dict -t "${pkgdir}/usr/share/fcitx5/pinyin/dictionaries"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
