# Maintainer: wuhgit <wuhgit@users.noreply.github.com>

pkgname=fcitx5-pinyin-custom-pinyin-dictionary
pkgver=20230217
_reponame=CustomPinyinDictionary
pkgrel=1
pkgdesc="Fcitx5 自建拼音输入法词库，百万常用词汇量。"
arch=('any')
url="https://github.com/wuhgit/CustomPinyinDictionary"
license=('GFDL' 'CCPL:by-sa')
source=("https://github.com/wuhgit/${_reponame}/releases/download/assets/CustomPinyinDictionary_Fcitx_${pkgver}.tar.gz")
sha256sums=('86f19d73b45edd6e71a69826907dfcaade620144ec160fa1ed2edb105cee585a')

package() {
  install -Dm644 CustomPinyinDictionary_Fcitx.dict -t ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/
}
