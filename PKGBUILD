# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=stash-bin
pkgver=0.16.1
pkgrel=1
pkgdesc="An organizer for your porn, written in Go"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/stashapp/stash'
license=('AGPL3')
provides=('stash')
source_x86_64=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux")
source_aarch64=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux-arm64v8")
source_armv7h=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux-arm32v7")
sha256sums_x86_64=('1ffa712ee72d0644c640316e9162e0367da72ed0be73ab2a13830dbbc9bfb81d')
sha256sums_aarch64=('89033e70e67a038517ae75bb0842fddf3102db3691eeb6acca4efd6ae12abb8c')
sha256sums_armv7h=('63f89843cc7741fcb72279fdf7e5adde2453300fd372ae3bddd834fd48e78dc3')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/stash"
}
