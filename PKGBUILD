# Maintainer: Eikano <lcuoin@gmail.com>
# Contributor: kccat <kg.kg.gl+aur at gmail dot com>

pkgname=ttf-opposans
pkgver=20231130
pkgrel=1
pkgdesc="OPPO Sans"
arch=('any')
license=('custom')
url='https://www.coloros.com/article/A00000050/'

source=("https://coloros-website-cn.allawnfs.com/font/OPPOSans3.0.zip")

sha256sums=('4ade22c51d034682c466cec99d8fad941b2541879d4f9dfab17d7187bb6b6a0e')

package() {
	cd "${srcdir}/231130 品牌字体 OPPO Sans 3.0/中文简体+西文 Simplified Chinese+Cyrillic/ttf(优先安装 ttf 格式 preferred）"
	install -dm755 "$pkgdir/usr/share/fonts/TTF"
	install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
}
