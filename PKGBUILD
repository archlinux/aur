pkgname=libnvidia-container-tools
pkgver=1.0.0_0.1.alpha.1
pkgrel=1
pkgdesc='NVIDIA container runtime library (command-line tools)'
arch=('x86_64')
url='https://github.com/NVIDIA/libnvidia-container'
license=('custom')
depends=(libcap libnvidia-container)
source_x86_64=("https://packages.nvidia.com/compute/container/packages/el/7/${pkgname}-1.0.0-0.1.alpha.1.x86_64.rpm/download")
sha256sums_x86_64=('6d1da5ababb0dde7c616ed91985780a084e8a9a2b011c777658309577bd429af')

package() {
  cd "$srcdir"
  install -D -m755 usr/bin/nvidia-container-cli "$pkgdir/usr/bin/nvidia-container-cli"
  install -D -m644 usr/share/licenses/*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
