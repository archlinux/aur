# Maintainer: Marcus Baw <marcus@bawmedical.co.uk>

pkgname=gitehr
pkgver=0.5.0
pkgrel=1
pkgdesc="A Git-based Electronic Health Record system - patient-owned, local-first, plain files and git"
arch=('x86_64' 'aarch64')
url="https://gitehr.org"
license=('AGPL-3.0-or-later')
depends=('git' 'glibc')
provides=('gitehr')
conflicts=('gitehr')
source_x86_64=("https://github.com/gitehr/gitehr/releases/download/v$pkgver/gitehr-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/gitehr/gitehr/releases/download/v$pkgver/gitehr-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('8c427f825fb94d4b6c449dbb809e404e12387f441ddced8fcc6c672b788e2f54')
sha256sums_aarch64=('26b8319bf153cadbb3cf093e222e8beeb57da355e772824ff9d6d4f3bd55fcab')

package() {
    install -Dm755 gitehr "${pkgdir}/usr/bin/gitehr"
}
