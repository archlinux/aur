# Maintainer: archblux <archblux@126.coml>

pkgname=ttf-lxgw-wenkai-screen
pkgver=1.300
pkgrel=1
pkgdesc="本字体是霞鹜文楷的屏幕舒适阅读版本,增强了字重，包括LXGWWenKaiScreen（使用文楷完整版字库，不以其他任何字体打底）和LXGWWenKaiScreenR（在文楷完整版字库基础上，使用Roboto补全缺失字符，可能有文字形态不统一）。另外带 GB 的表示 GB 2312、通用规范汉字表范围内汉字为陆标字形，不带 GB 的为原版文楷的半陆标字形。"
arch=('any')
url='https://github.com/lxgw/LxgwWenKai-Screen/'
license=('custom:OFL')

source=("$url/releases/download/v$pkgver/LXGWWenKaiGBScreen.ttf"
	      "$url/releases/download/v$pkgver/LXGWWenKaiGBScreenR.ttf"
	      "$url/releases/download/v$pkgver/LXGWWenKaiScreen.ttf"
	      "$url/releases/download/v$pkgver/LXGWWenKaiScreenR.ttf"
	)

sha256sums=("4ce7adad1f4d376035fb1067fb7642efd334f6716be23896e39589992423a9e3"
             "4d12bbbbb67b600f89defc4ec6f66664e8b4114fa4d3757f7914233d2c87f6df"
             "fb3ab80d1b638145d2040ec58ebe9adb35131c0bf6ef1b7322b7e7634448e7c4"
             "f857a1170fb4dab9c630612de28071118d1250cdcdaed8d940a6d04ce87c79f3"
           )

package() {
    install -d "$pkgdir/usr/share/fonts/TTF"
    cp *.ttf "$pkgdir/usr/share/fonts/TTF"
}
