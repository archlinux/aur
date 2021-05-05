# Maintainer: Kamil Śliwak <cameel2/at/gmail/com>

pkgname=kubeval-bin
pkgver=0.16.1
pkgrel=1
pkgdesc="Tool for validating Kubernetes YAML or JSON configuration files"
arch=('x86_64')
url="https://github.com/garethr/kubeval"
license=('apache')
provides=('kubeval')
conflicts=('kubeval' 'kubeval-git')
source=(https://github.com/garethr/kubeval/releases/download/v$pkgver/kubeval-linux-amd64.tar.gz)
sha256sums=('2d6f9bda1423b93787fa05d9e8dfce2fc1190fefbcd9d0936b9635f3f78ba790')


package() {
    install -Dm 755 "$srcdir/kubeval" "$pkgdir/usr/bin/kubeval"
}
