pkgname=libnvidia-container-tools-bin
_pkgname=libnvidia-container-tools
pkgver=1.0.1
pkgrel=1
pkgdesc='NVIDIA container runtime library (command-line tools)'
arch=('x86_64')
url='https://github.com/NVIDIA/libnvidia-container'
license=('custom')
depends=('libnvidia-container')
provides=('libnvidia-container-tools')
conflicts=('libnvidia-container-tools')
source=("https://nvidia.github.io/libnvidia-container/centos7/x86_64/${_pkgname}-1.0.1-1.x86_64.rpm")
sha256sums=('e59e91b2a04295350f771402223ea7c8e26aeee1444f71ab79dccce1fbcaebf9')

package() {
  cd "$srcdir"
  install -D -m755 usr/bin/nvidia-container-cli "$pkgdir/usr/bin/nvidia-container-cli"
  install -D -m644 usr/share/licenses/*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
