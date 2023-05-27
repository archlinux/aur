# Maintainer: ryosuke <ryosuke@tutamail.com>

pkgname=fcitx5-pinyin-moegirl
pkgver=20230514
_reponame=mw2fcitx
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org wiki"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'cc-by-nc-sa-3.0')
source=("https://github.com/outloudvi/${_reponame}/releases/download/${pkgver}/moegirl.dict")
sha256sums=('3b3afd1013e86928f5ed14c30b67cf31f32ed29d8cbbf0fd5a4c6d75dc373329')

package() {
  install -Dm644 moegirl.dict -t ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/
}
