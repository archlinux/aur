# Maintainer: David Birks <david@tellus.space>

pkgname=krew-bin
pkgdesc="Package manager for kubectl plugins"
pkgver=0.3.3
pkgrel=1
arch=('x86_64')
url="https://github.com/GoogleContainerTools/krew/"
license=('Apache')
provides=('krew' 'krew-bin')
source=("https://github.com/kubernetes-sigs/krew/releases/download/v${pkgver}/krew.tar.gz"
        "https://github.com/kubernetes-sigs/krew/releases/download/v${pkgver}/krew.yaml")
sha256sums=('2491801fc5b7823ab97fe5e9b23a6b79cdc65cae36953127e0410d827c1b883d'
            '0fd5633d5d7845ce0bcb9466c8ad095e17de9a5ce2893f0aad7e99ec72f1e7eb')

package() {
    ./krew-linux_amd64 install --manifest=krew.yaml --archive=krew.tar.gz
}
