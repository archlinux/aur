# Maintainer: wuhx <aur@xun.im>

pkgname=nerdctl-full-bin

pkgver=2.0.3
_gitver=2.0.3 
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
sha256sums_x86_64=('91bfb8faec1673f3e7c3a020812acffc50a7d7dd82019461f6cfa46435240903')
sha256sums_aarch64=('2a97f78e14cb3e024068d936c8fb801365981e5b48577e278907079de47e4d2c')