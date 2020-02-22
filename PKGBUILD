# Maintainer: Semyon Ivanov <semyon95@gmail.com>

pkgname=devspace-bin
pkgver=4.5.4
pkgrel=1
pkgdesc="Client-only, open-source dev tool for Kubernetes"
arch=('x86_64')
url="https://devspace.cloud"
license=('apache')
source=($pkgname-$pkgver::https://github.com/devspace-cloud/devspace/releases/download/v$pkgver/devspace-linux-amd64)
sha256sums=('f46cb332e8774f73965b5ef42440d8acc85723d9cd7f312c86331d392301baf0')

package() {
    install -Dm 755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/devspace"	
}

