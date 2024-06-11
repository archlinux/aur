# Maintainer: linzeen
# Contributor: linzeen
pkgname=lze-web
makedepends=('tar')
pkgver=1.1
pkgrel=1
pkgdesc="lze-web"
arch=('x86_64')
license=('PGP')
depends=('apache' 'php-apache' 'python-pip' 'python-paramiko' 'python-tornado')
provides=('lze-web')
options=('!strip' '!emptydirs')
install=${pkgname}.install
package(){
git clone https://github.com/linzeennnn/lze-web.git 
cp -r "lze-web/opt" "${pkgdir}/"
cp -r "lze-web/etc" "${pkgdir}/"
cp -r "lze-web/usr" "${pkgdir}/"
}
