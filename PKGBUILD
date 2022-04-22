# Maintainer: lomonosow <me@lsow.it>
pkgname=auth0-bin
archive=auth0-cli
pkgver=0.11.7
pkgrel=1
pkgdesc="auth0 is the command line to supercharge your development workflow"
arch=('x86_64' 'arm64')
url="https://github.com/auth0/auth0-cli"
license=('MIT')
depends=()
source_x86_64=("${archive}_${pkgver}_x86_64.tar.gz::$url/releases/download/v${pkgver}/${archive}_${pkgver}_Linux_x86_64.tar.gz")
source_arm64=("${archive}_${pkgver}_arm64.tar.gz::$url/releases/download/v${pkgver}/${archive}_${pkgver}_Linux_arm64.tar.gz")

sha256sums_x86_64=('d8114cc4896c7e33217c0de92bf03c4400e473ca56cdacc46af5bce53bb70157')
sha256sums_arm64=('e767c9feeb66d11028db35b8c4450058e3d1ee6c167a07e4d0400719fe2b8d97')


package() {
  install -Dm755 "$srcdir"/auth0 "${pkgdir}"/usr/bin/auth0
}
