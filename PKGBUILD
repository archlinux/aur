# Maintainer: EarthMind <linux @AT adres .DOT maskmy .DOT id>

pkgname=q-dns-bin
pkgdesc='A tiny command line DNS client with support for UDP, DoT, DoH, DoQ and ODoH.'
arch=('x86_64' 'aarch64')
pkgver='0.19.9'
pkgrel=2
license=('GPL-3.0')
url='https://github.com/natesales/q'
provides=('q-dns')
conflicts=('q-dns-git')

source_x86_64=("https://github.com/natesales/q/releases/download/v${pkgver}/q_${pkgver}_linux_amd64.deb")
source_aarch64=("https://github.com/natesales/q/releases/download/v${pkgver}/q_${pkgver}_linux_arm64.deb")

sha256sums_x86_64=('f58e8f2ff8afa23c41f732301b3c5907fc01638707c5b7c13de999665f4de92f')
sha256sums_aarch64=('6719541ee0215c9634978d6f3c6c51bbb826e473b2f0b809bdeeac43cb376980')

package() {
    tar xaf data.tar.gz -C "$pkgdir/"
}
