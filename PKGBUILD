# Maintainer: wuhgit <wuhgit@users.noreply.github.com>

pkgname=fcitx5-pinyin-custom-pinyin-dictionary
pkgver=20231202
_reponame=CustomPinyinDictionary
pkgrel=1
pkgdesc="Fcitx5 自建拼音输入法词库，百万常用词汇量。"
arch=('any')
url="https://github.com/wuhgit/CustomPinyinDictionary"
license=('GFDL' 'CCPL:by-sa')
source=("https://github.com/wuhgit/${_reponame}/releases/download/assets/CustomPinyinDictionary_Fcitx_${pkgver}.tar.gz")
sha256sums=('da33592c80b8f6cf5fc1a840369afb08e71033d2f94fa9c00f78c6c3790da3d3')

package() {
  install -Dm644 CustomPinyinDictionary_Fcitx.dict -t ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/
}
