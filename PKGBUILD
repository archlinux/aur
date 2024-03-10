# Maintainer: Firestar <zhang_zhijun@pku.edu.cn>
# Thanks for the advice of @peterjc123

pkgname=fcitx5-moegirl
pkgver=20240309
_reponame=mw2fcitx
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from zh.moegirl.org.cn"
arch=('any')
url="https://github.com/outloudvi/mw2fcitx"
license=('Unlicense' 'cc-by-nc-sa-3.0')
source=("moegirl_${pkgver}.dict::https://github.com/outloudvi/${_reponame}/releases/download/${pkgver}/moegirl.dict")
sha256sums=('8abf56400d9ccfc54b2f8ebf19a2d31409cbfc7e6f296ab7b1bcb01d370029bf')

package() {
   install -Dm644 moegirl_${pkgver}.dict -t ${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/moegirl.dict
}
