# Maintainer: archblux <archblux@126.coml>

pkgname=ttf-lxgw-wenkai-screen
pkgver=1.250.2
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

sha256sums=("a589cb95c818823c24eb5f96bc3bec2ebcec69b3cb6e9cccb336567e757fb876"
             "79601b6103b13c128d519f3f824832d3fac7f0cf91a508024da99c8fb1456d04"
             "47d304d5020c0391fe4b86aae93f5c9eb63d161528c4a2ce3db0f0897a64edd9"
             "a82c31b5f972f59e5560bc9da58c5ea6f283e3a5bcd1bff7fadf3c859a296c3e"
           )

package() {
    install -d "$pkgdir/usr/share/fonts/TTF"
    cp *.ttf "$pkgdir/usr/share/fonts/TTF"
}
