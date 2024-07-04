# Maintainer: Ling Wang <lingwang@wcysite.com>
pkgname=ruyi-bin
pkgver=0.13.0
pkgrel=3
pkgdesc="The package manager for RuyiSDK."
arch=("x86_64" "arm64" "riscv64")
url="https://github.com/ruyisdk/ruyi"
license=('Apache-2.0')
depends=('wget' 'git' 'tar' 'bzip2' 'xz' 'zstd')
provides=('ruyi=$pkgver')
options=('!strip') # !important, otherwise the binary will be broken
source_x86_64=("ruyi-$pkgver-bin::https://mirror.iscas.ac.cn/ruyisdk/ruyi/releases/$pkgver/ruyi.amd64")
source_arm64=("ruyi-$pkgver-bin::https://mirror.iscas.ac.cn/ruyisdk/ruyi/releases/$pkgver/ruyi.arm64")
source_riscv64=("ruyi-$pkgver-bin::https://mirror.iscas.ac.cn/ruyisdk/ruyi/releases/$pkgver/ruyi.riscv64")

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/ruyi-$pkgver-bin" "${pkgdir}/usr/bin/ruyi"
}
sha256sums_x86_64=('a639e2625642bdd8baa0f3f56cfbe25ad64f2fa04bee3f6330d6cb9bd2a75fdd')
sha256sums_arm64=('eb5c3d26a4bb130b93f7d5b38fab86868b63c828884d049dfc8fcbb99c69be54')
sha256sums_riscv64=('fe7def9559129df7b2612b8d4d2eae2e9b3928af10d0cc31895813806b8e58eb')
