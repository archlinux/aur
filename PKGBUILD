# Maintainer: Kamil Śliwak <cameel2/at/gmail/com>

pkgname=kubeval-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Tool for validating Kubernetes YAML or JSON configuration files"
arch=('x86_64')
url="https://github.com/garethr/kubeval"
license=('apache')
provides=('kubeval')
conflicts=('kubeval' 'kubeval-git')
source=(https://github.com/garethr/kubeval/releases/download/$pkgver/kubeval-linux-amd64.tar.gz)
sha256sums=('48167f84da3892ed509f0c4d32b4d6b1c6ddc458f176a89cb5746f85fc756955')

package() {
    install -Dm 755 "$srcdir/kubeval" "$pkgdir/usr/bin/kubeval"
}
