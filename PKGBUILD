pkgname=baml-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="BAML wrapper - toolchain manager and launcher (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
# Stripping rewrites the executable and destroys the packed BAML payload.
options=('!strip')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.3.0/baml-wrapper-no-self-update-0.3.0-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.3.0/baml-wrapper-no-self-update-0.3.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c6f051d2c2ca80acaaa85770c68c4bdb18e37b7a55f45e8f3b609639fd8f7ebf')
sha256sums_aarch64=('f0572d805bef7e52ce3cfa6b74a807e113e2777f4512355f8b3f4136b61e58a5')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
