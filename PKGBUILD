# Maintainer: archblux <archblux@126.coml>

pkgname=ttf-lxgw-wenkai-screen
pkgver=1.321
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

sha256sums=("0eb9b77e02a6b43f7aa8910b8c2b85bde1eb4dcded85cb0a331fb6a397bea387"
             "29d79f46a1895a5f3e641e9439364fc226ca8236da1deefc41171d3051a8d523"
             "661755e4e4be3e6a854704c9aa866536d04b91bdec78844e29f89b56cb936a89"
             "f8be8806df1b5ae369c9b18d7da3d9bb2e722a3c985aa818f1b7514198a765ca"
           )

package() {
    install -d "$pkgdir/usr/share/fonts/TTF"
    cp *.ttf "$pkgdir/usr/share/fonts/TTF"
}
