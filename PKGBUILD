# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Cotributor: Semyon Ivanov <semyon95@gmail.com>

pkgname=devspace-bin
pkgver=5.9.1
pkgrel=1
pkgdesc="The Fastest Developer Tool for Kubernetes, develop software directly inside Kubernetes"
arch=('x86_64')
url='https://devspace.sh'
license=('Apache')
source=($pkgname-$pkgver::https://github.com/loft-sh/devspace/releases/download/v$pkgver/devspace-linux-amd64)
sha256sums=('fab54f355fcb0629496069ab694b5ffbaf4145739cbd7bf705eb5ad73d34721b')

package() {
    install -Dm 755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/devspace"
}