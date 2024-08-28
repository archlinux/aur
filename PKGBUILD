# Maintainer: Sam Toxopeus <sam@toxopeus.it>
pkgname=kubectl-cnpg
pkgver=1.24.0
pkgrel=1
pkgdesc="A kubectl plugin to interact with CloudNativePG"
arch=('x86_64')
url="https://github.com/cloudnative-pg/cloudnative-pg"
license=('Apache 2.0')
groups=()
depends=('kubectl')
source=("$url/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_${arch}.tar.gz")
sha256sums=('38b9aa5dd22c9f4d6078f3be39ffd062be88bd3abd47abb4b7c6235576249112')

package() {
    cd "$srcdir"
    tar -xzf "${pkgname}_${pkgver}_linux_x86_64.tar.gz"
    install -Dm755 "kubectl-cnpg" "$pkgdir/usr/bin/kubectl-cnpg"
}
