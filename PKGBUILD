# Maintainer: Jovial Joe Jayarson <jovial7joe@hotmail.com>

pkgname=plymouth-theme-aregression
pkgver='1.0'
pkgrel=1
pkgdesc="A sleek boot up progress bar plymouth animation for Arch Linux"
arch=('any')
url="https://github.com/joe733/plymouth-theme-aregression"
license=('MIT')
depends=('plymouth')
makedepends=('git')
source=('git+https://github.com/joe733/plymouth-theme-aregression.git')
md5sums=('SKIP')

package() {
    install -dm 755 "$pkgdir"/usr/share/plymouth/themes/aregression/

    cp -r --no-preserve=ownership * "$pkgdir"/usr/share/plymouth/themes/aregression/

    # install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
