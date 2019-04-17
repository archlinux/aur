# Maintainer: David Birks <david@tellus.space>

pkgname=krew-bin
pkgdesc="Package manager for kubectl plugins"
pkgver=0.2.1
pkgrel=1
arch=('x86_64')
url="https://github.com/GoogleContainerTools/krew/"
license=('Apache')
provides=('krew' 'krew-bin')
source=("https://storage.googleapis.com/krew/v${pkgver}/krew.tar.gz"
        "https://storage.googleapis.com/krew/v${pkgver}/krew.yaml")
sha256sums=('dc2f2e1ec8a0acb6f3e23580d4a8b38c44823e948c40342e13ff6e8e12edb15a'
            'e7be8f3aa4d8d7e66f6c707f7c67007e29ba0ecd80bbfd3b5ec8c0f25d2bb672')

package() {
    ./krew-linux_amd64 install --manifest=krew.yaml --archive=krew.tar.gz
}
