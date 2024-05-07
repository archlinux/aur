# Maintainer: wuhx <aur@xun.im>

pkgname=nerdctl-full-bin

pkgver=2.0.0_beta.5
_gitver=2.0.0-beta.5 
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
sha256sums_x86_64=('655b217f689097dc1b655f9daf83c5be64ee9ee3ca491596388dfe89f980db58')
sha256sums_aarch64=('614a2ab280f5b17fcdbde1933bfb3364b06aae69b796cbb582d1935bb98190cd')