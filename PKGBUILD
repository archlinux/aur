# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=teleconsole-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Command line tool to share your UNIX terminal and forward local TCP ports to people you trust."
arch=('x86_64')
url="https://github.com/gravitational/teleconsole/"
license=('Apache')
depends=('glibc')
source=("https://github.com/gravitational/teleconsole/releases/download/${pkgver}/teleconsole-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('bcc08d8ea2c8a7ad01fb7a336c5f9ebd75b7b2624db9b0cc88c5f60b5c3e533b')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 -t "$pkgdir/usr/bin" teleconsole
    # no man pages, docs or web assets in release tarball
}
