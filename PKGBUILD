# Maintainer: Acidhub <contact@acidhub.click>

pkgname=meliaesvg-icon-theme
pkgver=1.2
pkgrel=1
pkgdesc='MeliaeSVG '
arch=('any')
url='http://sora-meliae.deviantart.com/'
license=('GPL')
source=('http://orig12.deviantart.net/7299/f/2010/065/9/1/meliae_svg_icon_theme_v__1_2_by_sora_meliae.zip')
md5sums=('3a4092b83ea8a935ab7e2b0e9074ec23')

package() {
    mkdir -p $pkgdir/usr/share/icons/
	bsdtar -xf MeliaeSVG.tar.gz
    cp -r MeliaeSVG $pkgdir/usr/share/icons/
}

