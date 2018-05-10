# Contributer: MOOKEY <xiaoxiavvv@sogou.com>
# Maintainer: Anapopo <favoursmoe@gmail.com>

pkgname=sogoupinyin-skin-roulan
pkgdesc="An Elegant Skin For fcitx-sogoupinyin"
pkgver=0.9
pkgrel=1
arch=('any')
url=https://pinyin.sogou.com/skins/detail/view/info/559973
license=('GPL')
depends=('fcitx-sogoupinyin')
source=("roulan-v${pkgver}.tar.gz")
md5sums=('dfb0f91da85876b5286b548dc7708275')

package() {
    cd ${srcdir}/roulan
    install -Dm 644 skin.ini ${pkgdir}/usr/share/sogou-qimpanel/skin/roulan/skin.ini
    install -Dm 644 save_skin.ini ${pkgdir}/usr/share/sogou-qimpanel/skin/roulan/save_skin.ini
    install -Dm 644 skin.ini_bak ${pkgdir}/usr/share/sogou-qimpanel/skin/roulan/skin.ini_bak
    install -Dm 644 柔兰.ssf ${pkgdir}/usr/share/sogou-qimpanel/skin/roulan/roulan.ssf
}
