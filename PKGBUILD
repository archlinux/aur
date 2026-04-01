# Maintainer: objz <me@objz.dev>
pkgname=envm
pkgver=0.3.0
pkgrel=1
pkgdesc="Portable environment variable manager"
arch=('x86_64' 'aarch64')
url="https://github.com/objz/envm"
license=('GPL3')
depends=()
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
        "README-${pkgver}::${url}/raw/v${pkgver}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/envm-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/envm-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'd52b65d842aaae19209f4f0e012aa051215b5bf4c7a30c413e4e5d6280a4eb4f')
sha256sums_x86_64=('45eaaa2030ed3eb38b1ef03620ad4b5d6d9abed3a4803bcab460577335218fb6')
sha256sums_aarch64=('97b97323a6d4cad3d5a1f80850b59efa63a0d9ddbd085cac1671f2580408d29f')

package() {
  install -Dm755 envm "$pkgdir/usr/bin/envm"
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
