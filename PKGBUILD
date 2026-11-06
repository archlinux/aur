pkgname=baml-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="BAML wrapper - toolchain manager and launcher (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
# Stripping rewrites the executable and destroys the packed BAML payload.
options=('!strip')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.3.1/baml-wrapper-no-self-update-0.3.1-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.3.1/baml-wrapper-no-self-update-0.3.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b3f60e6f9d4ef9f96811cf81de57db45f281d4661ea67e4984a8935792c3308c')
sha256sums_aarch64=('b2427ca6c40979806481eb92bfd5c83989b398b59cb23a04ae90957d967686ce')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
