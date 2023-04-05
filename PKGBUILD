# Maintainer: wuhx <aur@xun.im>

pkgname=nerdctl-full-bin
pkgver=1.3.0
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
sha256sums_x86_64=('ce4615eb027265d2aaa61f185388738096b652541f7fc7c607bc3f829dd5713d')
sha256sums_aarch64=('38bf61aa9b9d3982256c09c1a6b6206248e372d6ac3f82e80980687b1c84631c')