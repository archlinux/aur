# Maintainer: port19 <port19 at port19 dot xyz>
pkgname='bbyt'
pkgver=1.0
pkgrel=1
pkgdesc='A search centric youtube client'
arch=('any')
url='https://github.com/port19x/bbyt'
license=('Unlicense')
source=("${pkgname}::${url}/releases/download/v${pkgver}/${pkgname}")
sha256sums=('2a68862ec190d2d7183b433ba61e649c65ddaf3e328d6342625c4655985df521')
package() {
    cd "$srcdir"
    install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
