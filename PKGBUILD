# Maintainer: Kamil Śliwak <cameel2/at/gmail/com>

pkgname=kubeval-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="Tool for validating Kubernetes YAML or JSON configuration files"
arch=('x86_64')
url="https://github.com/garethr/kubeval"
license=('apache')
provides=('kubeval')
conflicts=('kubeval' 'kubeval-git')
source=(https://github.com/garethr/kubeval/releases/download/$pkgver/kubeval-linux-amd64.tar.gz)
sha256sums=('b75517531c30bc5d40eadcbdc92b808878d867f625c463299f842e3d2db862ae')

package() {
    install -Dm 755 "$srcdir/kubeval" "$pkgdir/usr/bin/kubeval"
}
