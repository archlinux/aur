# Maintainer: Yosef Langer (vasilevich1234 dot gmail dot ...)

pkgname=nginxbeautifier
pkgver=1.0.18
pkgrel=1
pkgdesc='Nginx config formatter and beautifier.'
arch=('any')
url='https://nginxbeautifier.com'
license=('Apache-2.0')
provides=('nginxbeautifier')
depends=('nodejs')
source=($pkgname::"git://github.com/vasilevich/${pkgname}.git")
sha512sum=('SKIP')
package() {
    cd "$pkgname"
    git checkout "49eaeb032466797705edcd4680d965e5d4ac513d"
    install -D -m 755 nginxbeautifier.js "$pkgdir/usr/bin/nginxbeautifier"
    
}
