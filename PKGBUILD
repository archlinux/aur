# Maintainer: BryanLiang <liangrui.ch@gmail.com>

pkgname=fcitx5-pinyin-cedict
pkgver=20231101
pkgrel=1
pkgdesc="根据CEDICT生成的词典"
arch=('any')
url="https://github.com/Bryan2333/fcitx5_dicts"
license=('MIT')
source=("https://github.com/Bryan2333/fcitx5_dicts/releases/download/${pkgver}/cedict.dict")
sha256sums=('c56dfbe739819eaf96fd4815014ba5c0b29132d854181cffded0e6f9db647fbe')

package() {
    install -Dm 644 cedict.dict -t "${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/"
}
