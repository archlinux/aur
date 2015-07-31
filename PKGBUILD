# Maintainer: Chris Severance aur.severach AatT spamgourmet.com

pkgname='git-aurcheck'
pkgver='0.1'
pkgrel='1'
pkgdesc='a helper like namcap that checks and offers solutions for common problems in git submissions to the AUR'
arch=('any')
license=('GPL')
depends=('bash')
source=("${pkgname}.sh")
sha256sums=('94cbd8b74e605da3ff685d2c934d02ff668f8a0fbcd5d2e5ffad82afc81ccf55')

package() {
  install -Dpm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
