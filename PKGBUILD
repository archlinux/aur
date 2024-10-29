# Maintainer: wuhx <aur@xun.im>

pkgname=nerdctl-full-bin

pkgver=2.0.0_rc.3
_gitver=2.0.0-rc.3 
pkgrel=1
pkgdesc="nerdctl full pkg, bundle with containerd/CNI plugin/RootlessKit"
arch=('x86_64' 'aarch64')
url="https://github.com/containerd/nerdctl"
license=('Apache')
source_aarch64=("nerdctl-full-${CARCH}-${pkgver}.tar.gz::https://github.com/containerd/nerdctl/releases/download/v${_gitver}/nerdctl-full-${_gitver}-linux-arm64.tar.gz")
source_x86_64=("nerdctl-full-${CARCH}-${pkgver}.tar.gz::https://github.com/containerd/nerdctl/releases/download/v${_gitver}/nerdctl-full-${_gitver}-linux-amd64.tar.gz")

package() {
  mkdir -p "$pkgdir/usr/local"
  tar Cxzvvf "$pkgdir/usr/local" nerdctl-full-${CARCH}-${pkgver}.tar.gz
}
sha256sums_x86_64=('84ba8cd0340645133085c4c5162d932aeaea9534f17d935ac1edbcd9cca6318e')
sha256sums_aarch64=('f5180b7fe48cdb514ceed2c226f4843a4d9e38e8d1f5c26a80b7f50ae29c73d3')