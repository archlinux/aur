# Maintainer: Sam Toxopeus <sam@toxopeus.it>
pkgname=kubectl-cnpg
pkgver=1.28.1 # renovate: datasource=github-tags depName=cloudnative-pg/cloudnative-pg
pkgrel=1
pkgdesc="A kubectl plugin to interact with CloudNativePG"
arch=('x86_64')
url="https://github.com/cloudnative-pg/cloudnative-pg"
license=('Apache 2.0')
groups=()
depends=('kubectl')
source=("$url/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_${arch}.tar.gz")
sha256sums=('5db1c680816a0534263bccccded965f059fa7c48aad1f381667881afef4dbad7')

package() {
    cd "$srcdir"
    tar -xzf "${pkgname}_${pkgver}_linux_x86_64.tar.gz"
    install -Dm755 "kubectl-cnpg" "$pkgdir/usr/bin/kubectl-cnpg"
}
