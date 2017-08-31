# Maintainer: Adam Isaac <aci747@engineer.com>
pkgname=tldr-bash-git
pkgver=0.33
pkgrel=1
pkgdesc="Bash client for tldr: community driven man-by-example."
arch=('any')
url="https://github.com/pepa65/tldr-bash-client"
source=("https://raw.githubusercontent.com/pepa65/tldr-bash-client/master/tldr")
license=('GPL')
sha256sums=('SKIP')
depends=('bash', 'unzip', 'curl')

package() {
  cd "${srcdir}"
  mkdir -p "$pkgdir/usr/local/bin"
  install -m755 ./tldr "$pkgdir/usr/local/bin/"

} 
