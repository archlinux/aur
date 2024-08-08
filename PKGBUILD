# Maintainer: Sam Toxopeus <sam@toxopeus.it>
pkgname=kubectl-cnpg
pkgver=1.23.3
pkgrel=1
pkgdesc="A kubectl plugin to interact with CloudNativePG"
arch=('x86_64')
url="https://github.com/cloudnative-pg/cloudnative-pg"
license=('Apache 2.0')
groups=()
depends=('kubectl')
source=("$url/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_${arch}.tar.gz")
sha256sums=('df6877f7dc1a59f281494687b9cf89d05a294f0e331ae9f05b251b8c176d0732')

package() {
    cd "$srcdir"
    tar -xzf "${pkgname}_${pkgver}_linux_x86_64.tar.gz"
    install -Dm755 "kubectl-cnpg" "$pkgdir/usr/bin/kubectl-cnpg"
}
