pkgname=baml-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="BAML wrapper - toolchain manager and launcher (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.1.0/baml-wrapper-0.1.0-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.1.0/baml-wrapper-0.1.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('54cb6eeb2e03a6dace612edd0ea0c044c855047ff3d0346aab1b5269d9209f5b')
sha256sums_aarch64=('8e5b1df2b89bcbe766cfef94c4788d054e32ddb28810757aad54d017e14d43b6')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
