# Maintainer: Semyon Ivanov <semyon95@gmail.com>

pkgname=devspace-bin
pkgver=4.3.2
pkgrel=1
pkgdesc="Client-only, open-source dev tool for Kubernetes"
arch=('x86_64')
url="https://devspace.cloud"
license=('apache')
source=($pkgname-$pkgver::https://github.com/devspace-cloud/devspace/releases/download/v$pkgver/devspace-linux-amd64)
sha256sums=('92c85f86ef30c00a22d9840bc393aa19da75c0b1d4d8355ada2d5e36f5926bcd')

package() {
    install -Dm 755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/devspace"	
}

