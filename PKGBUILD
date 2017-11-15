pkgname=libnvidia-container-tools
pkgver=1.0.0_0.1.alpha.2
pkgrel=1
pkgdesc='NVIDIA container runtime library (command-line tools)'
arch=('x86_64')
url='https://github.com/NVIDIA/libnvidia-container'
license=('custom')
depends=(libcap libnvidia-container)
source_x86_64=("https://nvidia.github.io/libnvidia-container/centos7/x86_64/${pkgname}-1.0.0-0.1.alpha.2.x86_64.rpm")
sha256sums_x86_64=('2d51fed4497457685e5b016dfcdfe897fa8b590ff0e017afd5ed7d523d65c9fe')

package() {
  cd "$srcdir"
  install -D -m755 usr/bin/nvidia-container-cli "$pkgdir/usr/bin/nvidia-container-cli"
  install -D -m644 usr/share/licenses/*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
