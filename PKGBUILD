# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: sekret (https://aur.archlinux.org/account/sekret)

_pkgname=marble-restricted-maps
pkgname="${_pkgname}-git"
pkgver=1.0
pkgrel=1
pkgdesc="Transitional package to transition to 'marble-restricted-maps', which now is a metapackage that depends on the individual packages that used to be directly included in this package."
arch=('any')
url="https://gitlab.com/marble-restricted-maps"
license=('custom: metapackage')
depends=(
  "marble-restricted-maps"
)
makedepends=()
provides=()
conflicts=()
replaces=()
source=(
  'license-metapackage-pd.txt'
)
sha256sums=(
  'af68dd29515606a94237214e4c33b0e3f4f2408ed92df3674a043bf2fa2c0078'
)

package() {
  install -D -v -m644 "${srcdir}/license-metapackage-pd.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.public-domain.txt"
}

# vim:set ts=2 sw=2 et:
