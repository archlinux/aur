# Maintainer: Marcus Baw <marcus@bawmedical.co.uk>

pkgname=gitehr
pkgver=0.4.0
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
sha256sums_x86_64=('4fa97a80dc35fb63c3dcfacf1062e5fa57c5a8af44152296e91cd61b4d96dfa5')
sha256sums_aarch64=('818fa969b1cfe4fc8bfef48fd5d67e89ad423ef06a53bd9631a3f2693bfeb327')

package() {
    install -Dm755 gitehr "${pkgdir}/usr/bin/gitehr"
}
