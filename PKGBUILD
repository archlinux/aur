# Maintainer: 0_byte <git@susnext.com>
pkgname=shgit-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A shell-based git client"
arch=('x86_64')
url="https://github.com/0byte-coding/shgit"
license=('MIT')
provides=('shgit')
conflicts=('shgit')
depends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/shgit-x86_64-linux-gnu.tar.gz")
sha256sums=('509995b72f78cfe621fae3e4a2bfdb6f59cd4c941fcc8b5a9f619513788996b7')

package() {
    install -Dm755 "$srcdir/shgit" "$pkgdir/usr/bin/shgit"
}
