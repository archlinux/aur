pkgname=baml-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="BAML wrapper - toolchain manager and launcher (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.2/baml-wrapper-no-self-update-0.2.2-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.2/baml-wrapper-no-self-update-0.2.2-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('57227aa619d22d464aa812c9100d95ae6b77c10437320051fd8874518dcf5e4d')
sha256sums_aarch64=('4e4beb7f047eaae0016a3ebba12538018694e07cde89ea30a8c31cfea550a530')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
