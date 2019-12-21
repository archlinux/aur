# Maintainer: Semyon Ivanov <semyon95@gmail.com>

pkgname=devspace-bin
pkgver=4.3.4
pkgrel=1
pkgdesc="Client-only, open-source dev tool for Kubernetes"
arch=('x86_64')
url="https://devspace.cloud"
license=('apache')
source=($pkgname-$pkgver::https://github.com/devspace-cloud/devspace/releases/download/v$pkgver/devspace-linux-amd64)
sha256sums=('a552e4e1ee78de5f6481647fedfc23676c5280859ade64031eefd7822fffa4b8')

package() {
    install -Dm 755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/devspace"	
}

