# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdrctl
pkgver=0.1.1
pkgrel=1
pkgdesc="Tool which adds/removes symlinks or lists the available or active plugins of vdr"
url="https://github.com/CReimer/vdrctl"
arch=('any')
license=('GPL3')
depends=('perl' 'pkg-config' 'vdr')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CReimer/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('ccca8b2ea13bc485fdd6f194d27273a2')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 vdrctl "$pkgdir/usr/bin/vdrctl"
  install -Dm644 bash-completion/vdrctl "$pkgdir/usr/share/bash-completion/completions/vdrctl"
}
