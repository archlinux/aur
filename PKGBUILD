# Maintainer: wuhx <aur@xun.im>

pkgname=nerdctl-full-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="nerdctl full pkg, bundle with containerd/CNI plugin/RootlessKit"
arch=('x86_64' 'aarch64')
url="https://github.com/containerd/nerdctl"
license=('Apache')
source_aarch64=("nerdctl-full-${CARCH}-${pkgver}.tar.gz::https://github.com/containerd/nerdctl/releases/download/v${pkgver}/nerdctl-full-${pkgver}-linux-arm64.tar.gz")
source_x86_64=("nerdctl-full-${CARCH}-${pkgver}.tar.gz::https://github.com/containerd/nerdctl/releases/download/v${pkgver}/nerdctl-full-${pkgver}-linux-amd64.tar.gz")

package() {
  mkdir -p "$pkgdir/usr/local"
  tar Cxzvvf "$pkgdir/usr/local" nerdctl-full-${CARCH}-${pkgver}.tar.gz
}
sha256sums_x86_64=('df84145a796b1466ce27a1bf8bdd76f911083be2ba5b57e7a2a6e27d4f05bede')
sha256sums_aarch64=('8a3bdc24eef1b7366a678f206aff37ce7ae22f184ad24ed723a92420796b68ca')