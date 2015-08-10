# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdrctl
pkgver=0.1.0
pkgrel=2
pkgdesc="Tool which adds/removes symlinks or lists the available or active plugins of vdr"
url="https://github.com/CReimer/vdrctl"
arch=('any')
license=('GPL3')
depends=('perl' 'pkg-config' 'vdr')
source=("https://github.com/CReimer/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('3ec22b89b7f02980738535d86262ac57')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 vdrctl "$pkgdir/usr/bin/vdrctl"
  install -Dm644 bash-completion/vdrctl "$pkgdir/usr/share/bash-completion/completions/vdrctl"
}
