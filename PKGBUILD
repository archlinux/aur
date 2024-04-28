# Maintainer: wuhx <aur@xun.im>

pkgname=nerdctl-full-bin

pkgver=2.0.0_beta.4
_gitver=2.0.0-beta.4 
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
sha256sums_x86_64=('a55c725540b8d60cf72b0ff7dfbeba6a26a89075815a66facb4b081a7ecd2c0a')
sha256sums_aarch64=('c6df33fdad367bf4977dfe42ff2480e931462439544b286be9286d9dca8cdcb0')