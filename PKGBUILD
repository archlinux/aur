# Maintainer: Yosef Langer (vasilevich1234 dot gmail dot ...)

pkgname=nginxbeautifier
pkgver=1.0.11
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
    git checkout "022e95d8f2dfc2ae5b8fe7744ac30fe78367b507"
    install -D -m 755 nginxbeautifier.js "$pkgdir/usr/bin/nginxbeautifier"
    
}
