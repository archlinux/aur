# Maintainer: Ali <Im_wrench@proton.me>

pkgname=allp-manager-bin
_pkgname=allp-manager
pkgver=0.3.5
pkgrel=1
pkgdesc="A transparent package-manager orchestrator for Linux (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/allp-manager/allp-manager"
license=('MIT')
depends=('gcc-libs')
provides=('allp' 'allp-manager')
conflicts=('allp' 'allp-manager' 'allp-manager-git')
source_x86_64=("https://github.com/allp-manager/allp-manager/releases/download/v${pkgver}/allp-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/allp-manager/allp-manager/releases/download/v${pkgver}/allp-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8bc197d6ece8b8476ae75ddcd7c54911c1b11ada92b749c7745b93521f9bd209')
sha256sums_aarch64=('beccaa745c5cc912d763e371a646c07221d607e0c4aa320579e0bf069905fa81')

package() {
  cd "$srcdir"
  install -Dm755 "allp" "$pkgdir/usr/bin/allp"
}
