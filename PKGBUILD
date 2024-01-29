# Maintainer: EarthMind <linux @AT adres .DOT maskmy .DOT id>

pkgname=q-dns-bin
pkgdesc='A tiny command line DNS client with support for UDP, DoT, DoH, DoQ and ODoH.'
arch=('x86_64' 'aarch64')
pkgver='0.19.2'
pkgrel=2
license=('GPL-3.0')
url='https://github.com/natesales/q'
provides=('q-dns')
conflicts=('q-dns-git')

source_x86_64=("https://github.com/natesales/q/releases/download/v${pkgver}/q_${pkgver}_linux_amd64.deb")
source_aarch64=("https://github.com/natesales/q/releases/download/v${pkgver}/q_${pkgver}_linux_arm64.deb")

sha256sums_x86_64=('d4f3384db64d41ada91ccbefae26a457d9ea9c93d486c8c2f59e92f0ab09015b')
sha256sums_aarch64=('941d19a3c5628e2bc9e53faa5f0006e204856dea0c8c43a7d02427e262495a60')

package() {
    tar xaf data.tar.gz -C "$pkgdir/"
}
