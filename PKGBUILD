# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Cotributor: Semyon Ivanov <semyon95@gmail.com>

pkgname=devspace-bin
pkgver=5.10.0
pkgrel=1
pkgdesc="The Fastest Developer Tool for Kubernetes, develop software directly inside Kubernetes"
arch=('x86_64')
url='https://devspace.sh'
license=('Apache')
source=($pkgname-$pkgver::https://github.com/loft-sh/devspace/releases/download/v$pkgver/devspace-linux-amd64)
sha256sums=('fc9c8fd92447a4d587b271d9640b265622e29f2372aeb3c331e86f2b814e43ce')

package() {
    install -Dm 755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/devspace"
}
