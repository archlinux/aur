pkgname='rumtricks'
pkgver=0.2.0
pkgrel=1
pkgdesc='Winetricks alternative'
arch=('x86_64')
url='https://github.com/jc141x/rumtricks'
license=('GPL3')
depends=(curl zstd wine jq)
conflicts=('rumtricks-git')
source=(
    "https://github.com/jc141x/${pkgname}/releases/download/${pkgver}/rumtricks.sh"
    "https://github.com/jc141x/${pkgname}/releases/download/${pkgver}/wha.sh"
 )
md5sums=('0db84e9c83cdd83d8d492b4bec89c738'
         '21d1c41cc011ffdcf237784820c3b3f9')

package() {
    install -Dm755 "rumtricks.sh" "$pkgdir/usr/bin/rumtricks"
    install -Dm755 "wha.sh" "$pkgdir/usr/bin/wha"
}
