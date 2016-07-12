# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-iranian-serif
pkgver=1.0
pkgrel=1
pkgdesc="A family of fonts, designed by support from Iranian National Initiative for Free and Open Source Software to provide a good looking and free font for Persian script."
arch=('any')
url="www.foss.ir"
license=('custom:Bitstream Vera')
groups=('persian-fonts')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("$pkgname-$pkgver.zip::https://fontlibrary.org/assets/downloads/iranian-serif/3bf122e0d984a0a116a95491c835ec49/iranian-serif.zip")
md5sums=('3bf122e0d984a0a116a95491c835ec49')

package() {	
	install -d $pkgdir/usr/share/{fonts,licenses}/$pkgname/
	install -m644 ./*.ttf $pkgdir/usr/share/fonts/$pkgname/ 
    install -m644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
