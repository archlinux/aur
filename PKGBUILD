# Maintainer: wuhx <aur@xun.im>

pkgname=nerdctl-full-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="nerdctl full pkg, bundle with containerd/CNI plugin/RootlessKit"
arch=('x86_64')
url="https://github.com/containerd/nerdctl"
license=('Apache')
source=("https://github.com/containerd/nerdctl/releases/download/v${pkgver}/nerdctl-full-${pkgver}-linux-amd64.tar.gz")
sha256sums=('3423cb589bb5058ff9ed55f6823adec1299fe2e576612fc6f706fe07eddd398b')

package() {
  mkdir -p "$pkgdir/usr/local"
  tar Cxzvvf "$pkgdir/usr/local" nerdctl-full-${pkgver}-linux-amd64.tar.gz
}
