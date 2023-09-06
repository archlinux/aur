# Maintainer: Vault81 <aur at vault81.de>
pkgname=git-repo-bin
pkgver=0.7.8
pkgrel=1
pkgdesc="CLI for a centralized git workflow, it works with Gerrit & AGit servers."
arch=('x86_64')
url="https://github.com/alibaba/git-repo-go"
license=('Apache')
depends=(
  'pacman>5'
  'git'
)
provides=('git-repo')
conflicts=('git-repo')

source_x86_64=("https://github.com/alibaba/git-repo-go/releases/download/v${pkgver}/${pkgname/-bin/}-${pkgver}-Linux-64.tar.gz")
sha256sums_x86_64=('92fe06087dea70d34e4cf62786b2bf58f51a47407a89775825a006b80acf0dc3')

package() {
  _output="${srcdir}/${pkgname/-bin/}-${pkgver}-Linux-64"
  install -Dm755 "${_output}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}

