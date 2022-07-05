pkgname='rumtricks'
pkgver=0.2.4
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
md5sums=('e438382fea3d427761a8d61dc783798d'
         'dbe42d5999901850cac864ee70120432')

package() {
    install -Dm755 "$srcdir/rumtricks-${pkgver}" "$pkgdir/usr/bin/rumtricks"
    install -Dm755 "$srcdir/wha-${pkgver}" "$pkgdir/usr/bin/wha"
}
