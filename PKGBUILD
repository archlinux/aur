# Maintainer: BryanLiang <liangrui.ch@gmail.com>

pkgname=fcitx5-pinyin-cedict
pkgver=20231017
pkgrel=1
pkgdesc="根据CEDICT生成的词典"
arch=('any')
url="https://github.com/Bryan2333/fcitx5_dicts"
license=('MIT')
source=("cedict.dict::https://github.com/Bryan2333/fcitx5_dicts/releases/download/cedict/${pkgver}-cedict.dict")
sha256sums=('2952a461cb57476c30cb1b5d209436c3a726256fda262efaa96c428bde53cc88')

package() {
  install -Dm 644 cedict.dict "${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/cedict.dict"
}
