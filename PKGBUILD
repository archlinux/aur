pkgname="git-graph"
pkgdesc="Git graph cli tool"
pkgver="0.6.0"
pkgrel=1
url="https://github.com/mlange-42/git-graph"
source=("https://github.com/mlange-42/git-graph/releases/download/0.6.0/git-graph-0.6.0-linux-amd64.tar.gz")
sha256sums=("4fe32ef70b40e2c9d205930d2581ec022a8cb6f4e5b44e408da1201d4edd8bfe")
arch=("x86_64")

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -m 755 git-graph ${pkgdir}/usr/bin/
}
