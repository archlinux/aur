pkgname=nvidia-container-runtime
pkgver=2.0.0+1.docker17.12.1
pkgrel=1
pkgdesc='NVIDIA container runtime'
arch=('x86_64')
url='https://github.com/NVIDIA/nvidia-container-runtime'
license=('custom')
depends=(libseccomp libnvidia-container-tools)
source_x86_64=("https://nvidia.github.io/nvidia-container-runtime/centos7/x86_64/${pkgname}-2.0.0-1.docker17.12.1.x86_64.rpm")
sha256sums_x86_64=('cff7d20475df9f9961f69ec6bfa11e123b693e0bc11ea360e1cc65e7021a6a67')

package() {
  cd "$srcdir"
  install -m755 -d "$pkgdir/usr/bin"
  install -D -m755 usr/bin/* "$pkgdir/usr/bin/"
  install -D -m644 usr/share/licenses/$pkgname-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
