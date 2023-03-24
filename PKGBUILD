# Maintainer: wuhgit <wuhgit@users.noreply.github.com>

pkgname=fcitx5-pinyin-custom-pinyin-dictionary
pkgver=20230324
_reponame=CustomPinyinDictionary
pkgrel=1
pkgdesc="Fcitx5 自建拼音输入法词库，百万常用词汇量。"
arch=('any')
url="https://github.com/wuhgit/CustomPinyinDictionary"
license=('GFDL' 'CCPL:by-sa')
source=("https://github.com/wuhgit/${_reponame}/releases/download/assets/CustomPinyinDictionary_Fcitx_${pkgver}.tar.gz")
sha256sums=('9eae738b63d4c2dd44b11b6cb9b038706d1028466dc079a87fb04adb05198915')

package() {
  install -Dm644 CustomPinyinDictionary_Fcitx.dict -t ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/
}
