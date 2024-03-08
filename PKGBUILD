# Maintainer: BryanLiang <liangrui.ch@gmail.com>
# Contributor: ryosuke <ryosuke@tutamail.com>

pkgname=fcitx5-pinyin-moegirl
pkgver=20240309
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org wiki"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'cc-by-nc-sa-3.0')
source=("moegirl-${pkgver}.dict::${url}/releases/download/${pkgver}/moegirl.dict")
sha256sums=('8abf56400d9ccfc54b2f8ebf19a2d31409cbfc7e6f296ab7b1bcb01d370029bf')

package() {
  install -Dm644 moegirl-${pkgver}.dict ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/moegirl.dict
}
