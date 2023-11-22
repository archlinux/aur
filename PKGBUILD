# Maintainer: Firestar <zhang_zhijun@pku.edu.cn>
# Thanks for the advice of @peterjc123

pkgname=fcitx5-moegirl
pkgver=20231114
_reponame=mw2fcitx
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from zh.moegirl.org.cn"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'cc-by-nc-sa-3.0')
source=("moegirl_${pkgver}.dict::https://github.com/outloudvi/${_reponame}/releases/download/${pkgver}/moegirl.dict")
sha256sums=('c7e5e401388d30d6dc4a237cecc91146f2a236ecefa66903aed1a4c1d9c8b183')

package() {
   install -Dm644 moegirl_${pkgver}.dict -t ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/moegirl.dict
}
