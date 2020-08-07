# Maintainer: Howard Cheung <mail@h-cheung.cf>

pkgname=fcitx5-pinyin-moegirl-rime
pkgver=20200730
_reponame=fcitx5-pinyin-moegirl
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org for rime"
arch=('any')
url="https://github.com/outloudvi/fcitx5-pinyin-moegirl"
license=('cc-by-nc-sa-3.0')
#makedepends=('libime' 'opencc' 'pypinyin')
source=("https://github.com/outloudvi/${_reponame}/releases/download/${pkgver}/moegirl.dict.yaml")
md5sums=('78c4d4a29cb97393011a5a69a87ec91d')

package() {
  install -Dm644 moegirl.dict.yaml -t $pkgdir/usr/share/rime-data/
}
