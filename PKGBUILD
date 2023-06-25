# Maintainer: ryosuke <ryosuke@tutamail.com>

pkgname=fcitx5-pinyin-moegirl
pkgver=20230617
_reponame=mw2fcitx
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org wiki"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'cc-by-nc-sa-3.0')
source=("https://github.com/outloudvi/${_reponame}/releases/download/${pkgver}/moegirl.dict")
sha256sums=('7949ffd986077916f583639bcb072498dc7ef00075237e276214d83e964c45fa')

package() {
  install -Dm644 moegirl.dict -t ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/
}
