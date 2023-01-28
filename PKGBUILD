# Maintainer: ryosuke <ryosuke@tutamail.com>

pkgname=fcitx5-pinyin-moegirl
pkgver=20230114
_reponame=mw2fcitx
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org wiki"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'cc-by-nc-sa-3.0')
source=("https://github.com/outloudvi/${_reponame}/releases/download/${pkgver}/moegirl.dict")
sha256sums=('4e95b19b5265e96c5d02a068db6bb977bc50bffdcfd383c33042df40e5fb2244')

package() {
  install -Dm644 moegirl.dict -t ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/
}
