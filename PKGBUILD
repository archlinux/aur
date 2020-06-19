# Maintainer: Skykey <zcxzxlc@163.com>


pkgname=fcitx5-bing-input-color
pkgver=0.0.0.20200619
_commit=0704f3e486fda2ea87069acc9354d2efafa014fc
pkgrel=1
pkgdesc="一款模仿Windows10 2004自带浅色输入法的Fcitx5皮肤."
arch=('any')
url="https://github.com/skykeyjoker/Fcitx5-Bing-Input-Color"
license=('MIT')
source=("https://github.com/skykeyjoker/Fcitx5-Bing-Input-Color/archive/$_commit/$pkgname-$_commit.tar.gz")
sha512sums=('e0bfbfaae2f62272bada56c0120cb624710f6f011955338c692e0a45c7b836dd763e3a06bdfd906c421d44d3c4c3463241c2804bbf4a3a3c1023d57fe8b78513')


package() {
	_variant_name=Fcitx5-Bing-Input-Color
	cd "Fcitx5-Bing-Input-Color-$_commit"
	
	install -Dm644 highlight.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/highlight.png
  	install -Dm644 panel.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/panel.png
  	install -Dm644 arrow.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/arrow.png
  	install -Dm644 radio.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/radio.png
  	install -Dm644 theme.conf "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/theme.conf
}
