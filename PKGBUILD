# Maintainer: Star_caorui <Star_caorui@hotmail.com>
# Contributor: 嘟嘟虫

pkgname=fcitx5-skin-zhuobihaotian-luotianyi
pkgver=0.1
pkgrel=1
pkgdesc='"倬彼昊天·洛天依" theme from Sogou input method. (A ssf to fcitx5 skin, made by ssfconv.)'
arch=('any')
url='https://pinyin.sogou.com/skins/detail/view/info/477711'
depends=('fcitx5')
makedepends=('ssfconv')
source=('倬彼昊天·洛天依.ssf::https://pinyin.sogou.com/d/skins/download.php?skin_id=477711&rf=detail')
sha512sums=('2655657324ed64bebe819b14fc78dccf31adb8288414f7899db5f1c471d9e0208e40970161b5383483ada291e432a0614aefad13bbfb70c6848e02157a16bb94')

package() {
  cd ${srcdir}
  ssfconv -t fcitx5 倬彼昊天·洛天依.ssf 倬彼昊天·洛天依
  install -dm755 "${pkgdir}"/usr/share/fcitx5/themes/$pkgname
  install -m644 倬彼昊天·洛天依/* "$pkgdir"/usr/share/fcitx5/themes/$pkgname
}
