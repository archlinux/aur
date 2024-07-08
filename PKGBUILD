# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=bulk-rename-plus
pkgver=2.0.3
pkgrel=1
pkgdesc='Tiny yet Powerful Non-Interactive Bulk Renamer, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/bulk-rename-plus"
license=('GPL3')
depends=('coreutils' 'glibc')
md5sums=('45a32560bf5fc404511a9645d79abf98')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

build() {
    cd "${srcdir}/$pkgname-${pkgver}"
    make
}

package() {
    cd "${srcdir}/$pkgname-${pkgver}"
    install -Dm755 bulk_rename++ "$HOME/.local/bin/bulk_rename++"
}
