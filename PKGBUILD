# Maintainer: EarthMind <linux @AT adres .DOT maskmy .DOT id>

pkgname=q-dns-bin
pkgdesc='A tiny command line DNS client with support for UDP, DoT, DoH, DoQ and ODoH.'
arch=('x86_64' 'aarch64')
pkgver='0.19.11'
pkgrel=1
license=('GPL-3.0')
url='https://github.com/natesales/q'
provides=('q-dns')
conflicts=('q-dns-git')

source_x86_64=("https://github.com/natesales/q/releases/download/v${pkgver}/q_${pkgver}_linux_amd64.deb")
source_aarch64=("https://github.com/natesales/q/releases/download/v${pkgver}/q_${pkgver}_linux_arm64.deb")

sha256sums_x86_64=('0dbe7e90e1f5515f5a0d06213df3cbcd91764acd0b2324745968e63918b57732')
sha256sums_aarch64=('a507dc173664646a24ebec19273ea6239e6344b2039d852624b73bbad299b53c')

package() {
    tar xaf data.tar.gz -C "$pkgdir/"
}
