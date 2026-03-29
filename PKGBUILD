# Maintainer: Tu Nombre <tu@email.com>
pkgname=tofu-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="Offline, encrypted TOTP manager for the terminal. Trust On First Use."
arch=('x86_64')
url="https://github.com/Thecloudff7/tofu"
license=('MIT')
provides=('tofu')
conflicts=('tofu' 'tofu-git')
source=("tofu-${pkgver}::$url/releases/download/v${pkgver}/tofu-linux-x64")
sha256sums=('e9f8e53579230f56aaa72a3518034d66d15f357d0fb05cb05ef098344b66249f')

package() {
    install -Dm755 "$srcdir/tofu-${pkgver}" "$pkgdir/usr/bin/tofu"
}
