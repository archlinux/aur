# Maintainer: Radoslav Georgiev <rgeorgiev583@gmail.com>
pkgname='compose-switch-bin'
pkgver=1.0.2
pkgrel=1
pkgdesc='compatibility layer for the docker-compose V1 CLI (binary release)'
arch=('x86_64')
url='https://github.com/docker/compose-switch'
license=('Apache')
source=("https://github.com/docker/compose-switch/releases/download/v${pkgver}/docker-compose-linux-amd64")
sha256sums=('71bece7c8a0439523ee77fd3b37f6d17fb24f9d368edc69b6cb02675698984b7')

package() {
    install -Dm755 docker-compose-linux-amd64 "$pkgdir/usr/bin/docker-compose"
}
