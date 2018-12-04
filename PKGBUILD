# Maintainer: Yosef Langer (vasilevich1234 dot gmail dot ...)

pkgname=nginxbeautifier
pkgver=1.0.16
pkgrel=1
pkgdesc='Nginx config formatter and beautifier.'
arch=('any')
url='https://nginxbeautifier.com'
license=('Apache-2.0')
provides=('nginxbeautifier')
depends=('nodejs')
source=($pkgname::"git://github.com/vasilevich/${pkgname}.git")
md5sums=('SKIP')
package() {
    cd "$pkgname"
    git checkout "5cf5c914a268ce0720f3862bd6e781b37ca768da"
    install -D -m 755 nginxbeautifier.js "$pkgdir/usr/bin/nginxbeautifier"
    
}
