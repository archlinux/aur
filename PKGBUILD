# Maintainer: linzeen
# Contributor: linzeen
pkgname=lze-web
makedepends=('tar')
pkgver=2.1
pkgrel=1
pkgdesc="lze-web"
arch=('x86_64')
license=('PGP')
depends=('apache' 'php-apache' 'python-pip' 'python-paramiko' 'python-tornado')
provides=('lze-web')
options=('!strip' '!emptydirs')
install=${pkgname}.install
package(){
git clone --depth=1 https://github.com/linzeennnn/lze-web.git 
install -t  "${pkgdir}/" "lze-web/opt"
install -t  "${pkgdir}/" "lze-web/usr"
install -t  "${pkgdir}/" "lze-web/etc"
}
