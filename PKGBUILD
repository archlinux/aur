# Maintainer: Semyon Ivanov <semyon95@gmail.com>

pkgname=devspace-bin
pkgver=4.5.0
pkgrel=1
pkgdesc="Client-only, open-source dev tool for Kubernetes"
arch=('x86_64')
url="https://devspace.cloud"
license=('apache')
source=($pkgname-$pkgver::https://github.com/devspace-cloud/devspace/releases/download/v$pkgver/devspace-linux-amd64)
sha256sums=('3166e2be83e3b6ea4ea6f5947513fe0b7de034c769b563e7234f6871f19f819e')

package() {
    install -Dm 755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/devspace"	
}

