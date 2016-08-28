# Maintainer: Yosef Langer (vasilevich1234 dot gmail dot ...)

pkgname=nginxbeautifier
pkgver=Stable
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
    git checkout "e165def8f4b107bcd3f9f593f83bfa286070b42e"
    install -D -m 755 nginxbeautifier.js "$pkgdir/usr/bin/nginxbeautifier"
    
}
