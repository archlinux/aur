# Maintainer: Skykey <zcxzxlc@163.com>


pkgname=fcitx5-bing-input-color
pkgver=0.0.0.20200619
_commit=afb6de827bf213ea5c7d027607374230c4206f22
pkgrel=1
pkgdesc="一款模仿Windows10 2004自带浅色输入法的Fcitx5皮肤."
arch=('any')
url="https://github.com/skykeyjoker/Fcitx5-Bing-Input-Color"
license=('MIT')
source=("https://github.com/skykeyjoker/Fcitx5-Bing-Input-Color/archive/$_commit/$pkgname-$_commit.tar.gz")
sha512sums=('cb15a0e4b7c8e8c0e5383ee5148ab74410bfc77dce37f7fae71a5055661cd7c3e3b64e333a6dc94adfc9750815646ad27f1b7a8a4cf68d14dbb1d38d23d472ad')


package() {
	_variant_name=Fcitx5-Bing-Input-Color
	cd "Fcitx5-Bing-Input-Color-$_commit"
	
	install -Dm644 highlight.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/highlight.png
  	install -Dm644 panel.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/panel.png
  	install -Dm644 arrow.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/arrow.png
  	install -Dm644 radio.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/radio.png
  	install -Dm644 theme.conf "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/theme.conf
}
