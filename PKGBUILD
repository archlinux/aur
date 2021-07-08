# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2021-07-08.

_pkgname="libsystemd-provides"
pkgname="${_pkgname}"
epoch=0
pkgver=0.1
pkgrel=1
pkgdesc="Metapackage depending on 'systemd-libs' and providing the 'libsystemd'-dependency. Can be used on Artix systems."
arch=(any)
license=('custom: public domain')
groups=()
depends=("systemd-libs")
makedepends=()
optdepends=()
provides=("libsystemd=${pkgver}")
replaces=()
conflicts=()

source=(
  "license-metapackage-pd.txt"
)

sha256sums=(
  "1e86f8ac1ad7315c76f4db8bf6a1dbdde6825ac95ff468e431bbe452b6865ae6"
)

package() {
  install -D -m644 "${srcdir}/license-metapackage-pd.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
}
