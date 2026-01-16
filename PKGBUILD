# Maintainer: Yanis Zafirópulos (Dr.Kameleon) <yaniszaf@gmail.com>

pkgname=arturo
pkgver=0.10.0
pkgrel=1
pkgdesc="Simple, expressive & portable programming language for efficient scripting"
arch=('x86_64' 'aarch64')
url="https://arturo-lang.io"
license=('MIT')
depends=('webkit2gtk-4.1' 'gmp' 'mpfr')
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://arturo-lang.io/files/arturo-${pkgver}-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://arturo-lang.io/files/arturo-${pkgver}-linux-arm64.zip")
sha256sums_x86_64=('764e484bf226ed14494b0e87601af4cd399da778d31ea059150bb07a621bb35d')
sha256sums_aarch64=('a9ac02ef848112c01b5ca54ee2cb8fdf139af49e606b683d31c07427555b2cd6')

package() {
    cd "$srcdir"
    
    # Install binary
    install -Dm755 arturo "$pkgdir/usr/bin/arturo"
    
}
