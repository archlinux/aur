# Maintainer: Abhinav Gupta <mail@abhinavg.net>

pkgname='restack-bin'
pkgver=0.8.0
pkgrel=1
pkgdesc='Makes interactive Git rebase aware of intermediate branches.'
url='https://github.com/abhinav/restack'
arch=('aarch64' 'armv7h' 'x86_64')
license=('GPL-2.0')
provides=('restack')
conflicts=('restack')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/abhinav/restack/releases/download/v0.8.0/restack-linux-arm64.tar.gz")
sha256sums_aarch64=('8b1935eea19b1455fad442088ba085e125010cdc8f91d0f2afdb4f8cb4a4ae2a')

source_armv7h=("${pkgname}_${pkgver}_armv7h.tar.gz::https://github.com/abhinav/restack/releases/download/v0.8.0/restack-linux-armv7.tar.gz")
sha256sums_armv7h=('745359f1e780776f78f28e2831dbb1a8efa64d83213fe3f527c7a49d817139f4')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/abhinav/restack/releases/download/v0.8.0/restack-linux-amd64.tar.gz")
sha256sums_x86_64=('55d79209e3ee2b6909458df20e4052003f5aea5f44029c79c994f79674e37ac3')

package() {
  install -Dm755 "./restack" "${pkgdir}/usr/bin/restack"
}
