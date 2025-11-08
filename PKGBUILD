# Maintainer: EarthMind <linux @AT adres .DOT maskmy .DOT id>

pkgname=q-dns-bin
pkgdesc='A tiny command line DNS client with support for UDP, DoT, DoH, DoQ and ODoH.'
arch=('x86_64' 'aarch64')
pkgver='0.19.10'
pkgrel=2
license=('GPL-3.0')
url='https://github.com/natesales/q'
provides=('q-dns')
conflicts=('q-dns-git')

source_x86_64=("https://github.com/natesales/q/releases/download/v${pkgver}/q_${pkgver}_linux_amd64.deb")
source_aarch64=("https://github.com/natesales/q/releases/download/v${pkgver}/q_${pkgver}_linux_arm64.deb")

sha256sums_x86_64=('06384aa5472255131c19b0f221df9c64e9c75b26814b7ef1b59f3b92292cb321')
sha256sums_aarch64=('358270c35cd3d91a738f5750ececb3b468de5d57bb7c79cddedb778bfb2aab0c')

package() {
    tar xaf data.tar.gz -C "$pkgdir/"
}
