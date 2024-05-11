# Maintainer:
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Truocolo <truocolo@aol.com>
# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>

pkgname=hardhat
pkgver=2.22.3
pkgrel=1
pkgdesc='Ethereum development environment for professionals'
arch=('x86_64')
url="https://github.com/NomicFoundation/hardhat"
license=('MIT' 'Unlicense')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgbase}-${pkgver}.tgz")
sha512sums=('93c255d8409635c843e9a864836051e70295c58d0e88aa2dedfbb1888a512b47eb46ac8e963711daf2b081648bc3a60878370d340e31c9b8fb3a0ecd4b1af684')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${pkgbase}-${pkgver}.tgz"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set sw=2 ts=2 et:
