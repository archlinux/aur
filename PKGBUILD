# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocm-core
pkgver=4.5.2
pkgrel=1
pkgdesc='AMD ROCm core package'
arch=('x86_64')
url='https://rocmdocs.amd.com/en/latest/'
license=()
depends=()
source=()
sha256sums=()

package() {
  install -Dm644 /dev/stdin "$pkgdir/opt/rocm/.info/version" <<-EOF
4.5.2-164
EOF
  install -Dm644 /dev/stdin "$pkgdir/opt/rocm/include/rocm/rocm_version.h" <<-EOF
#define ROCM_VERSION_MAJOR   4
#define ROCM_VERSION_MINOR   5
#define ROCM_VERSION_PATCH   2
EOF
}
