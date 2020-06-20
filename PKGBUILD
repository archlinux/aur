# Maintainer: Skykey <zcxzxlc@163.com>


pkgname=fcitx5-bing-input-color
pkgver=0.0.0.20200620
_commit=10a5fba51899dbbe756528b0bb60f941aa56140c
pkgrel=1
pkgdesc="一款模仿Windows10 2004自带浅色输入法的Fcitx5皮肤."
arch=('any')
url="https://github.com/skykeyjoker/Fcitx5-Bing-Input-Color"
license=('MIT')
source=("https://github.com/skykeyjoker/Fcitx5-Bing-Input-Color/archive/$_commit/$pkgname-$_commit.tar.gz")
sha512sums=('9860df8be91726b07d3a75dc4f17b17cafc3eca34a2e3889c1c94833262d279a933bf654e9bbd3cd37e3d3fee4080679d3edf28f99ee34ad51b0119452715048')


package() {
	_variant_name=Fcitx5-Bing-Input-Color
	cd "Fcitx5-Bing-Input-Color-$_commit"
	
	install -Dm644 highlight.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/highlight.png
  	install -Dm644 panel.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/panel.png
  	install -Dm644 arrow.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/arrow.png
  	install -Dm644 radio.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/radio.png
  	install -Dm644 theme.conf "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/theme.conf
}
