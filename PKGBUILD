# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=git-stree
pkgver=0.4.5
pkgrel=1
pkgdesc="A better Git subtree helper command"
arch=('any')
url="http://deliciousinsights.github.io/git-stree/"
license=('MIT')
depends=('git')
source=("https://github.com/deliciousinsights/git-stree/archive/${pkgver}.tar.gz")
sha256sums=('5504ac90871c73c92c21f5cd84b0bf956c521b237749e2b2dd699dbe0c096af8')

package() {
  cd "git-stree-${pkgver}"

  install -Dm755 git-stree "${pkgdir}/usr/bin/git-stree"
  install -Dm644 git-stree-completion.bash "${pkgdir}/usr/share/bash-completion/completions/git-stree"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/git-stree/README.md"
}
