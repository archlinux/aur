# Maintainer: archblux <archblux@126.coml>

pkgname=ttf-lxgw-wenkai-screen
pkgver=1.510
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

sha256sums=("496adb8e9b3906f9cf98a80e12ec7e6b72f31db6bd422aabf971f0eef75b17a4"
             "24053cec96f782a4b5997629ad6298b79c67ccc565651f7dd8f366b2a9d31775"
             "db0f0a6714787afa5e842e7a2a786466c8043bc397d2d7361d5f126277e06d8d"
             "884b114d55ab4c1ac73f651dc631a820d99320eac0b058de14684c3727be9f58"
           )

package() {
    install -d "$pkgdir/usr/share/fonts/TTF"
    cp *.ttf "$pkgdir/usr/share/fonts/TTF"
}
