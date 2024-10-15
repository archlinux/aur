# Maintainer: archblux <archblux@126.coml>

pkgname=ttf-lxgw-wenkai-screen
pkgver=1.501
pkgrel=1
pkgdesc="本字体是霞鹜文楷的屏幕舒适阅读版本,增强了字重，包括LXGWWenKaiScreen（使用文楷完整版字库，不以其他任何字体打底）和LXGWWenKaiScreenR（在文楷完整版字库基础上，使用Roboto补全缺失字符，可能有文字形态不统一）。另外带 GB 的表示 GB 2312、通用规范汉字表范围内汉字为陆标字形，不带 GB 的为原版文楷的半陆标字形。"
arch=('any')
url='https://github.com/lxgw/LxgwWenKai-Screen/'
license=('custom:OFL')

source=("$url/releases/download/v$pkgver/LXGWWenKaiGBScreen.ttf"
	      "$url/releases/download/v$pkgver/LXGWWenKaiScreen.ttf"
 	      "$url/releases/download/v$pkgver/LXGWWenKaiMonoGBScreen.ttf"
        "$url/releases/download/v$pkgver/LXGWWenKaiMonoScreen.ttf"
	)

sha256sums=("ee8e1867e25124e7d7266c671c71316a17f0f1ae87c2841a5a32accca14f90cf"
             "7a6dee879de778df2fd6e7a2c35ad656d0b46ed783ec81b75f583db648c14490"
             "b012104b5b5ad49d6ce899dd47cefe486fb14bca828c5e45dac33063e0587bc4"
             "bcefb96518484ada48f4ff52193dacdc7a67213101769025a16b2459b44e8f96"
           )

package() {
    install -d "$pkgdir/usr/share/fonts/TTF"
    cp *.ttf "$pkgdir/usr/share/fonts/TTF"
}
