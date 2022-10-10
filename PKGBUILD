pkgname="git-graph"
pkgdesc="Git graph cli tool"
pkgver="0.5.1"
pkgrel=1
url="https://github.com/mlange-42/git-graph"
source=("https://github.com/mlange-42/git-graph/releases/download/0.5.1/git-graph-0.5.1-linux-amd64.tar.gz")
sha256sums=("cd6ae8ff870ace8588e94c84dad39c4b97583abd0cabc57f60fa42a45088c6c8")
arch=("x86_64")

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -m 755 git-graph ${pkgdir}/usr/bin/
}
