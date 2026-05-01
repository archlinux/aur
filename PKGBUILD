# Maintainer: Synflow <synflow@elektronische-nachricht.de>
pkgname=oscr-ui-bin
pkgver=11.0.2
pkgrel=1
pkgdesc="OSCR-UI - Open Source Combat Reader (GUI)"
arch=('x86_64')
url="https://github.com/STOCD/OSCR-UI"
license=('GPL-3.0')
depends=('python')
source=("https://github.com/STOCD/OSCR-UI/releases/download/v${pkgver}/oscr-ui-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('439af44281ef151fbc96e7d510d03b7dcbded73b65a177de6879096df6d41c8a')

package() {
  cd "${srcdir}"

  cp -a "opt" "${pkgdir}/"
  cp -a "usr" "${pkgdir}/"

  if [[ -f "$pkgdir/usr/bin/oscr-ui" ]]; then
    chmod 755 "$pkgdir/usr/bin/oscr-ui"
  fi
}
