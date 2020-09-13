# Maintainer: Skykey <zcxzxlc@163.com>


pkgname=fcitx5-bing-input-color
pkgver=0.0.0.20200914
pkgrel=1
pkgdesc="一款模仿Windows10 2004自带浅色输入法的Fcitx5皮肤."
arch=('any')
url="https://github.com/skykeyjoker/Fcitx5-Bing-Input-Color"
license=('MIT')
install=fcitx5-bing-input-color.install
source=("https://github.com/skykeyjoker/Fcitx5-Bing-Input-Color/releases/download/0.0.0.20200914/fcitx5-bing-input-color-20200914.tar.gz")
sha512sums=('93cc0e6a8417af8db269e14fb0aff44f37fc489c63a80731c70730ff8b027a768fbadfbf13faa10e3ebcd2ab96c5b5fc363f7155753cda8ed108263b5f74aa54')


package() {
    _variant_name=Fcitx5-Bing-Input-Color
	cd $srcdir/tar
	
	# PNG
	mkdir -p "$pkgdir"/usr/share/fcitx5/themes/$_variant_name
	cp *.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/
	cp highlight-Sea-Foam-Green.png "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/highlight.png
  	
  	# CONF
  	install -Dm644 theme.conf "$pkgdir"/usr/share/fcitx5/themes/$_variant_name/theme.conf
  	
}
