# Maintainer: Chris Severance aur.severach AatT spamgourmet.com

pkgname='git-aurcheck'
pkgver=0.1
pkgrel=1
pkgdesc='a helper like namcap that checks and offers solutions for common problems in git submissions to the AUR'
arch=('any')
license=('GPL')
depends=('bash')
source=("${pkgname}.sh")
sha256sums=('59e6f6e64c5dfabc2ff2572de0b64c2a4867c4431a45f5607ebe98cd6e86a98a')

pkgver() {
  sed -ne "s:^_opt_VERSION='\([^']\+\)'"'$:\1:p' "${pkgname}.sh"
}

package() {
  install -Dpm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
