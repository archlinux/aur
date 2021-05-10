# Maintainer: ccicnce113424 <ccicnce113424@gmail.com>
pkgname=microsoft-edge-beta
pkgver=91.0.864.19
pkgrel=1
pkgdesc="Microsoft Edge, converted from .deb package"
arch=("x86_64")
url="https://www.microsoftedgeinsider.com/"
license=('custom')
depends=()
source=(
	"https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-beta/microsoft-edge-beta_${pkgver}-1_amd64.deb"
)
sha256sums=('545ff6c1481704dba905722b73c9dbaf9b35e5a5bcb68373e9291addbaead8aa')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}
}
