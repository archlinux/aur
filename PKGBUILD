# Maintainer: Semyon Ivanov <semyon95@gmail.com>

pkgname=devspace-bin
pkgver=4.6.2
pkgrel=1
pkgdesc="Client-only, open-source dev tool for Kubernetes"
arch=('x86_64')
url="https://devspace.cloud"
license=('apache')
source=($pkgname-$pkgver::https://github.com/devspace-cloud/devspace/releases/download/v$pkgver/devspace-linux-amd64)
sha256sums=('a7f238eea30e5ddb5d784def8777ab4dc4cebeb643bef589176e7063d364914f')

package() {
    install -Dm 755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/devspace"	
}

