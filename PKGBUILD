# Maintainer: EarthMind <linux @AT adres .DOT maskmy .DOT id>

pkgname=q-dns-bin
pkgdesc='A tiny command line DNS client with support for UDP, DoT, DoH, DoQ and ODoH.'
arch=('x86_64' 'aarch64')
pkgver='0.19.12'
pkgrel=1
license=('GPL-3.0')
url='https://github.com/natesales/q'
provides=('q-dns')
conflicts=('q-dns-git')

source_x86_64=("https://github.com/natesales/q/releases/download/v${pkgver}/q_${pkgver}_linux_amd64.deb")
source_aarch64=("https://github.com/natesales/q/releases/download/v${pkgver}/q_${pkgver}_linux_arm64.deb")

sha256sums_x86_64=('da9deee4f97eba5287876d6fb62b1b607b6474b308eec22c6332b3b5965124c5')
sha256sums_aarch64=('34ada9cbe9c6ba88248fe37918a15a46f2996b60e16d62777f5acad7c3613e84')

package() {
    tar xaf data.tar.gz -C "$pkgdir/"
}
