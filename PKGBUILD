# Maintainer: Howard Cheung <mail@h-cheung.cf>

pkgname=fcitx5-pinyin-moegirl-rime
pkgver=20200620
_reponame=fcitx5-pinyin-moegirl
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org for rime"
arch=('any')
url="https://github.com/outloudvi/fcitx5-pinyin-moegirl"
license=('cc-by-nc-sa-3.0')
#makedepends=('libime' 'opencc' 'pypinyin')
source=("https://github.com/outloudvi/${_reponame}/releases/download/v${pkgver}/moegirl.dict.yaml")
md5sums=("0828609ad5fb79a46bd63c21b6c51289")

package() {
  install -Dm644 moegirl.dict.yaml -t $pkgdir/usr/share/rime-data/
}
