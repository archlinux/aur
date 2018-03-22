# Maintainer: edward-p <micro.fedora@gmail.com>
pkgname=ttf-consolas-with-yahei-powerline-git
pkgver='0.1.1'
pkgrel=0
pkgdesc="Consolas-with-Yahei with powerline patched with nerd-fonts)"
arch=(any)
url=https://github.com/crvdgc/Consolas-with-Yahei
depends=(fontconfig xorg-font-utils)
conflicts=(ttf-consolas-with-yahei)
makedepends=(tar)
fontname='consolas-with-yahei'
install=$pkgname.install

prepare(){
	git clone --depth=1 https://github.com/crvdgc/Consolas-with-Yahei.git
}
package() {
	mkdir -p "$pkgdir"/usr/share/fonts/$fontname
	chmod -R 755 "$pkgdir"/usr/
	cp Consolas-with-Yahei/ttf/Consolas-with-Yahei\ Nerd\ Font.ttf "$pkgdir"/usr/share/fonts/$fontname/consnerd.ttf
	cp Consolas-with-Yahei/ttf/Consolas-with-Yahei\ Bold\ Nerd\ Font.ttf "$pkgdir"/usr/share/fonts/$fontname/consnerdb.ttf
	cp Consolas-with-Yahei/ttf/Consolas-with-Yahei\ Italic\ Nerd\ Font.ttf "$pkgdir"/usr/share/fonts/$fontname/consnerdi.ttf
	cp Consolas-with-Yahei/ttf/Consolas-with-Yahei\ Bold\ Italic\ Nerd\ Font.ttf "$pkgdir"/usr/share/fonts/$fontname/consnerdz.ttf
}
