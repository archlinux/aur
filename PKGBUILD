# Maintainer: ryosuke <ryosuke@tutamail.com>

pkgname=fcitx5-pinyin-moegirl
pkgver=20211116
_reponame=mw2fcitx
pkgrel=2
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org wiki"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'cc-by-nc-sa-3.0')
source=("https://github.com/outloudvi/${_reponame}/releases/download/${pkgver}/moegirl.dict")
md5sums=('9c6389111333ccec085b628e739df12d')

package() {
  install -Dm644 moegirl.dict -t ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/
}
