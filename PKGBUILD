# Maintainer: Sam Toxopeus <sam@toxopeus.it>
pkgname=kubectl-cnpg
pkgver=1.28.0 # renovate: datasource=github-tags depName=cloudnative-pg/cloudnative-pg
pkgrel=1
pkgdesc="A kubectl plugin to interact with CloudNativePG"
arch=('x86_64')
url="https://github.com/cloudnative-pg/cloudnative-pg"
license=('Apache 2.0')
groups=()
depends=('kubectl')
source=("$url/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_${arch}.tar.gz")
sha256sums=('d39f8623ff4de6bc7a3013e596b808432ae50773ddac56efe04e9ded2205bbf1')

package() {
    cd "$srcdir"
    tar -xzf "${pkgname}_${pkgver}_linux_x86_64.tar.gz"
    install -Dm755 "kubectl-cnpg" "$pkgdir/usr/bin/kubectl-cnpg"
}
