# Maintainer: Marcus Baw <marcus@bawmedical.co.uk>

pkgname=gitehr
pkgver=0.4.1
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
sha256sums_x86_64=('ed00d6365225648f78ae79b40641007d1f522a8d969a21dc2f83358e7ab82c24')
sha256sums_aarch64=('73da4e50e70d745b6f00b30533597f787b1d31b19560123be3e1d5d4f028e61a')

package() {
    install -Dm755 gitehr "${pkgdir}/usr/bin/gitehr"
}
