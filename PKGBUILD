# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Cotributor: Semyon Ivanov <semyon95@gmail.com>

pkgname=devspace-bin
_pkgver=5.11.0-beta.0
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The Fastest Developer Tool for Kubernetes, develop software directly inside Kubernetes"
arch=('x86_64')
url='https://devspace.sh'
license=('Apache')
source=($pkgname-$pkgver::https://github.com/loft-sh/devspace/releases/download/v$_pkgver/devspace-linux-amd64)
sha256sums=('8f4b85e9cb481cb3eaeb106512632e04871da69a5312188c1a4f1880b4a2c8ca')

package() {
    install -Dm 755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/devspace"
}
