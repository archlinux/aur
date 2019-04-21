# Maintainer: Kamil Śliwak <cameel2/at/gmail/com>

pkgname=kubeval-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="Tool for validating Kubernetes YAML or JSON configuration files"
arch=('x86_64')
url="https://github.com/garethr/kubeval"
license=('apache')
provides=('kubeval')
conflicts=('kubeval' 'kubeval-git')
source=(https://github.com/garethr/kubeval/releases/download/$pkgver/kubeval-linux-amd64.tar.gz)
sha256sums=('c16bb0f20d811ad71191e9130cba6866fa5b7e5ed36708e8e19d55946c11c540')

package() {
    install -Dm 755 "$srcdir/kubeval" "$pkgdir/usr/bin/kubeval"
}
