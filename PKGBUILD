# Maintainer: linzeen
# Contributor: linzeen
pkgname=lze-web
makedepends=('tar')
pkgver=7.0
pkgrel=0
pkgdesc="lze-web"
arch=('x86_64')
license=('PGP')
depends=('apache' 'php-apache' 'libnotify' 'wmctrl' 'libpulse' 'brightnessctl' 'playerctl')
provides=('lze-web')
options=('!strip' '!emptydirs')
install=${pkgname}.install
package(){
git clone --depth=1 https://github.com/linzeennnn/lze-web.git 
cp -r "lze-web/opt" "${pkgdir}/"
    cp -r "lze-web/usr" "${pkgdir}/"
    cp -r "lze-web/etc" "${pkgdir}/"
}
