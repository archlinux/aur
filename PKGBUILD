# Maintainer: wuhx <aur@xun.im>

pkgname=nerdctl-full-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="nerdctl full pkg, bundle with containerd/CNI plugin/RootlessKit"
arch=('x86_64')
url="https://github.com/containerd/nerdctl"
license=('Apache')
source=("https://github.com/containerd/nerdctl/releases/download/v${pkgver}/nerdctl-full-${pkgver}-linux-amd64.tar.gz")
sha256sums=('ed2d3662fd2866875e107df20f7da6dd32fafa8fa3e8aa9b6b774af20af5ddaa')

package() {
  mkdir -p "$pkgdir/usr/local"
  tar Cxzvvf "$pkgdir/usr/local" nerdctl-full-${pkgver}-linux-amd64.tar.gz
}
