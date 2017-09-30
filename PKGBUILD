# Maintainer: Adam Isaac <aci747@engineer.com>
pkgname=tldr-bash-git
pkgver=0.33
pkgrel=2
pkgdesc="Bash client for tldr: community driven man-by-example."
arch=('any')
url="https://github.com/pepa65/tldr-bash-client"
source=("git+https://github.com/pepa65/tldr-bash-client.git")
license=('GPL')
sha256sums=('SKIP')
depends=('bash' 'unzip' 'curl')
makedepends=('git')

package() {
  cd tldr-bash-client
  mkdir -p "$pkgdir/usr/local/bin"
  install -m755 tldr "$pkgdir/usr/local/bin/"

} 
