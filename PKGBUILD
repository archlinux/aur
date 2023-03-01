# Maintainer: wuhx <aur@xun.im>

pkgname=nerdctl-full-bin
pkgver=1.2.1
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
sha256sums_x86_64=('e8a3e40d442c566ee494375a4c563121da69d7c7837f50f4a3a171742757b36c')
sha256sums_aarch64=('1334bedbc9704994795bae88138807bd74e8bf2a23717491af5b8ae3aebebcda')