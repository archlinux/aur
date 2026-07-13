# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=bulk-rename-plus-bin
pkgver=2.1.0
pkgrel=1
pkgdesc='Tiny yet Powerful Non-Interactive Bulk Renamer, written in C++'
arch=('x86_64')
url="https://github.com/siyia2/bulk-rename-plus"
license=('GPL-3.0-or-later')
provides=('bulk-rename-plus')
conflicts=('bulk-rename-plus')
depends=('coreutils' 'glibc')
source=("${pkgname}-${pkgver}::https://github.com/siyia2/bulk-rename-plus/releases/download/v${pkgver}/bulk_rename++")
md5sums=('d418de1c86d018b0c7af8e41cfb3e9d5')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/bulk_rename++"
}
