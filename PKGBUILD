# Maintainer: Star_caorui <Star_caorui@hotmail.com>

pkgname=fcitx5-skin-zhuobihaotian-luotianyi
pkgdesc='"倬彼昊天·洛天依" theme from Sogou input method. (A ssf to fcitx5 skin, made by ssfconv.)'
url='https://pinyin.sogou.com/skins/detail/view/info/477711'
pkgver=2014.03.26
pkgrel=1
arch=('any')
depends=('fcitx5')
makedepends=('ssfconv')
source=('倬彼昊天·洛天依.ssf::https://pinyin.sogou.com/d/skins/download.php?skin_id=477711&rf=detail')
sha512sums=('2655657324ed64bebe819b14fc78dccf31adb8288414f7899db5f1c471d9e0208e40970161b5383483ada291e432a0614aefad13bbfb70c6848e02157a16bb94')

build() {
  ssfconv --type fcitx5 ${srcdir}/倬彼昊天·洛天依.ssf ${srcdir}/倬彼昊天·洛天依
}

package() {
  install -dm755 "${pkgdir}"/usr/share/fcitx5/themes/"${pkgname}"
  install -m644 "${srcdir}"/倬彼昊天·洛天依/* "${pkgdir}"/usr/share/fcitx5/themes/"${pkgname}"
}
