# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=bulk-rename-plus
pkgver=2.0.1
pkgrel=1
pkgdesc='Tiny yet Powerful Non-Interactive Bulk Renamer, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/bulk-rename-plus"
license=('GPL3')
depends=('coreutils' 'glibc')
md5sums=('e5806126f36e0afc9a17169e44415769')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

build() {
    cd "${srcdir}/$pkgname-${pkgver}"
    make
}

package() {
    cd "${srcdir}/$pkgname-${pkgver}"
    install -Dm755 bulk_rename++ "$HOME/.local/bin/bulk_rename++"
}
