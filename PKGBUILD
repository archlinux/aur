# Maintainer: BryanLiang <liangrui.ch@gmail.com>
# Contributor: ryosuke <ryosuke@tutamail.com>

pkgname=fcitx5-pinyin-moegirl
pkgver=20231114
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org wiki"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'cc-by-nc-sa-3.0')
source=("moegirl-${pkgver}.dict::${url}/releases/download/${pkgver}/moegirl.dict")
sha256sums=('c7e5e401388d30d6dc4a237cecc91146f2a236ecefa66903aed1a4c1d9c8b183')

package() {
  install -Dm644 moegirl-${pkgver}.dict ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/moegirl.dict
}
