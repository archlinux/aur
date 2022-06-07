# Maintainer: ryosuke <ryosuke@tutamail.com>

pkgname=fcitx5-pinyin-moegirl
pkgver=20220218
_reponame=mw2fcitx
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org wiki"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'cc-by-nc-sa-3.0')
source=("https://github.com/outloudvi/${_reponame}/releases/download/${pkgver}/moegirl.dict")
sha256sums=('d788f20b0a17db13026308a6a693c8e05d2b42f54cef2b32dc0470239b70d0e4')

package() {
  install -Dm644 moegirl.dict -t ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/
}
