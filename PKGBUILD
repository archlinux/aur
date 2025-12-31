# Maintainer: wuhgit <wuhgit@users.noreply.github.com>

pkgname=fcitx5-pinyin-custom-pinyin-dictionary
pkgver=20260101
_reponame=CustomPinyinDictionary
pkgrel=1
pkgdesc="Fcitx5 自建拼音输入法词库，百万常用词汇量。"
arch=('any')
url="https://github.com/wuhgit/CustomPinyinDictionary"
license=('GFDL' 'CCPL:by-sa')
source=("https://github.com/wuhgit/${_reponame}/releases/download/assets/CustomPinyinDictionary_Fcitx.dict")
sha256sums=('63677b0e1bcd9276e8eeef41553ab532bf6061278558d9efa3629b0ebe8836e5')

package() {
  install -Dm644 CustomPinyinDictionary_Fcitx.dict "${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/CustomPinyinDictionary_Fcitx.dict"
}
