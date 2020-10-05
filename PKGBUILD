# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdrctl
pkgver=1.0.0
pkgrel=1
pkgdesc="Tool which adds/removes symlinks or lists the available or active plugins of vdr"
url="https://github.com/VDR4Arch/vdrctl"
arch=('any')
license=('GPL3')
depends=('perl' 'pkg-config' 'vdr')
source=("$pkgname-$pkgver.tar.gz::https://github.com/VDR4Arch/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('f02ec49db633267b88f097d646b3487dbe9184fc1c25392af5738c8a9d7ed75c')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 vdrctl "$pkgdir/usr/bin/vdrctl"
  install -Dm644 bash-completion/vdrctl "$pkgdir/usr/share/bash-completion/completions/vdrctl"
}
