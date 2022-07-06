pkgname='rumtricks'
pkgver=0.3.1
pkgrel=1
pkgdesc='Winetricks alternative'
arch=('x86_64')
url='https://github.com/jc141x/rumtricks'
license=('GPL3')
depends=(curl zstd wine xz)
conflicts=('rumtricks-git')
source=(
    "rumtricks-${pkgver}::https://github.com/jc141x/${pkgname}/releases/download/${pkgver}/rumtricks.sh"
    "wha-${pkgver}::https://github.com/jc141x/${pkgname}/releases/download/${pkgver}/wha.sh"
 )
md5sums=('a81a69dc983f86455e93a448cc1fa340'
         'f277131232d95c7ed321c944844b0bbd')

package() {
    install -Dm755 "$srcdir/rumtricks-${pkgver}" "$pkgdir/usr/bin/rumtricks"
    install -Dm755 "$srcdir/wha-${pkgver}" "$pkgdir/usr/bin/wha"
}
