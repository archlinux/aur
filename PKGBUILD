# Maintainer: archblux <archblux@126.coml>

pkgname=ttf-lxgw-wenkai-screen
pkgver=1.315
pkgrel=1
pkgdesc="本字体是霞鹜文楷的屏幕舒适阅读版本,增强了字重，包括LXGWWenKaiScreen（使用文楷完整版字库，不以其他任何字体打底）和LXGWWenKaiScreenR（在文楷完整版字库基础上，使用Roboto补全缺失字符，可能有文字形态不统一）。另外带 GB 的表示 GB 2312、通用规范汉字表范围内汉字为陆标字形，不带 GB 的为原版文楷的半陆标字形。"
arch=('any')
url='https://github.com/lxgw/LxgwWenKai-Screen/'
license=('custom:OFL')

source=("$url/releases/download/v$pkgver/LXGWWenKaiGBScreen.ttf"
	      "$url/releases/download/v$pkgver/LXGWWenKaiGBScreenR.ttf"
	      "$url/releases/download/v$pkgver/LXGWWenKaiScreen.ttf"
	      "$url/releases/download/v$pkgver/LXGWWenKaiScreenR.ttf"
 	      "$url/releases/download/v$pkgver/LXGWWenKaiMonoGBScreen.ttf"
        "$url/releases/download/v$pkgver/LXGWWenKaiMonoScreen.ttf"
	)

sha256sums=("df3a41176273a2394d126d269a5b651825a5d960d97566693d099b24274b2ac4"
             "358960cd6c55c9938b9d4db897ba415ec200b8111eba43005704be2a48eeb8b5"
             "e0aefdecb1f250fcc2f6114189caf23f1aeed27758b30d18a80d703065e6496d"
             "dae64218489ed10f27a8b48be6c8b20a2b6d6685e9cb336ddacf7686773836b6"
             "7003b830b0dafad72cd0e9f2743aa07d01e1e5856039b67187270a3d9f120374"
             "2ed3e7eb90c48f06245f796e13c458b860d4c807507aaffa98699442cb30b9ec"
           )

package() {
    install -d "$pkgdir/usr/share/fonts/TTF"
    cp *.ttf "$pkgdir/usr/share/fonts/TTF"
}
