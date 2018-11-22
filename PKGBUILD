# Maintainer: Jason Staten <jstaten07 gmail>
# Co-maintainer: Thor K. Høgås <thor alfakrøll roht dott no>
# PKGBUILD Source: https://git.sr.ht/~statianzo/pkgbuild-wercker-cli

pkgname=wercker-cli
pkgver=1.0.1401
pkgrel=2
pkgdesc='Wercker CLI'
url='https://devcenter.wercker.com/development/cli/'
license=('unknown')
arch=('x86_64')
depends=()
makedepends=()
optdepends=()
source=("https://s3.amazonaws.com/downloads.wercker.com/cli/versions/${pkgver}/linux_amd64/wercker")
md5sums=('24826155b172fc77f75f9544620c7baa')
sha256sums=('6ffad306f56a1b9a8a44093eaa1bc07cd64a116829a38d388ad175ad3bb0f84e')

package() {
  cd "${srcdir}"
  install -D -m755 "wercker" "${pkgdir}/usr/bin/wercker"
}
