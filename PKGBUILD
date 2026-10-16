pkgname=baml-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="BAML wrapper - toolchain manager and launcher (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.5/baml-wrapper-no-self-update-0.2.5-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.5/baml-wrapper-no-self-update-0.2.5-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('23129e133259c2bb43973827b85567db1c5b5c27ea55b0dc515e8291301dbc1b')
sha256sums_aarch64=('3b2bec68ace1f9432d1041a49a0a23b035bb1c2c09dacbd2b1ad86498d3ff74c')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
