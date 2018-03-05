pkgname=libnvidia-container-tools
pkgver=1.0.0_0.1.alpha.3
pkgrel=1
pkgdesc='NVIDIA container runtime library (command-line tools)'
arch=('x86_64')
url='https://github.com/NVIDIA/libnvidia-container'
license=('custom')
depends=(libcap libnvidia-container)
source_x86_64=("https://nvidia.github.io/libnvidia-container/centos7/x86_64/${pkgname}-1.0.0-0.1.alpha.3.x86_64.rpm")
sha256sums_x86_64=('18c41b64307564708569aa64fbd6b9c71fdcba07c124b8d61580b2a21a663305')

package() {
  cd "$srcdir"
  install -D -m755 usr/bin/nvidia-container-cli "$pkgdir/usr/bin/nvidia-container-cli"
  install -D -m644 usr/share/licenses/*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
