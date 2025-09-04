# Maintainer: alchemmist <anton.ingrish@gmail.com>
pkgname=devsyringe
pkgver=1.0.15
pkgrel=1
pkgdesc="Developer tool for hard injection to files"
arch=('x86_64' 'aarch64')
url="https://github.com/alchemmist/devsyringe"
license=('MIT')
depends=()
source=("https://github.com/alchemmist/devsyringe/releases/download/v${pkgver}/devsyringe_${pkgver}_linux_amd64.tar.gz")
sha256sums=('SKIP')

package() {
    mkdir -p "$pkgdir"/usr/bin
    tar -xzf "$srcdir/devsyringe_${pkgver}_linux_amd64.tar.gz" -C "$pkgdir"/usr/bin
    chmod +x "$pkgdir"/usr/bin/dsy
}

