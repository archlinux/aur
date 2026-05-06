# Maintainer: Gary <garylinux666@aur.archlinux.org>
# Contributor: Open Design upstream <https://github.com/nexu-io/open-design>

pkgname=open-design-bin
pkgver=0.3.0
pkgrel=3
pkgdesc="Local-first design product – Electron desktop (prebuilt AppImage) [WAITING FOR UPSTREAM]"
arch=('x86_64')
url="https://github.com/nexu-io/open-design"
license=('Apache-2.0')
depends=('fuse2')
optdepends=('open-design: daemon + web UI (CLI-only companion package)')

# La URL se activará cuando upstream publique el AppImage oficial
# source=("${pkgname}-${pkgver}.AppImage::https://github.com/nexu-io/open-design/releases/download/open-design-v${pkgver}/Open-Design-${pkgver}.AppImage")
source=("README-WAIT.txt")
sha256sums=('SKIP')

prepare() {
  echo ""
  echo "=============================================="
  echo "  open-design-bin aún no está disponible"
  echo "=============================================="
  echo ""
  echo "El equipo de Open Design aún no publica AppImage para Linux."
  echo "Mientras tanto, puedes usar:"
  echo ""
  echo "  yay -S open-design        (daemon + web UI)"
  echo "  open-design               (ejecutar)"
  echo ""
  echo "O seguir el issue de Linux en:"
  echo "  https://github.com/nexu-io/open-design/issues"
  echo ""
  echo "=============================================="
  exit 1
}

package() {
  install -Dm644 "${srcdir}/README-WAIT.txt" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
