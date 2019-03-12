# Maintainer: David Birks <david@tellus.space>

_pkgname=doctl
pkgname=doctl-bin
pkgver=1.14.0
pkgrel=1
pkgdesc="A command line tool for DigitalOcean services"
url="https://github.com/digitalocean/doctl"
license=('Apache')
arch=('x86_64')
options=('strip')
source=(https://github.com/digitalocean/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz)
sha512sums=('7305a8e060460b4b41a0c0bf1de98933f0dfde383fba6502478a57d47d9bcd63d9d368a21739e2ba903559651d8a7308fe9fbac3e4cd9cd2cc1bf24f5c879fbd')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -m 755 doctl "${pkgdir}/usr/bin/"
}
