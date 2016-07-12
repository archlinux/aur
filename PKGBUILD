# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-iranian-sans
pkgver=1.0
pkgrel=1
pkgdesc="A family of fonts, designed by support from Iranian National Initiative for Free and Open Source Software to provide a good looking and free font for Persian script."
arch=('any')
url="www.foss.ir"
license=('custom:Bitstream Vera')
groups=('persian-fonts')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("$pkgname-$pkgver.zip::https://fontlibrary.org/assets/downloads/iranian-sans/2619cbcea5e87e4bb3d77b2e2a94466f/iranian-sans.zip")
md5sums=('2619cbcea5e87e4bb3d77b2e2a94466f')

package() {	
	install -d $pkgdir/usr/share/{fonts,licenses}/$pkgname/
	install -m644 ./*.ttf $pkgdir/usr/share/fonts/$pkgname/ 
    install -m644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
