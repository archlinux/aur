# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.15.107955'
pkgrel=1
pkgdesc='Jottacloud backup and sync. Whether you are an individual, family or business, Jottacloud lets you store, share and be productive wherever you are.'
url='https://www.jottacloud.com/'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('custom: Copyright Jotta AS')
install='jotta-cli.install'

source_x86_64=("https://repo.jotta.us/debian/pool/main/j/jotta-cli/jotta-cli_${pkgver}_amd64.deb")
source_i686=("https://repo.jotta.us/debian/pool/main/j/jotta-cli/jotta-cli_${pkgver}_i386.deb")
source_armv7h=("https://repo.jotta.us/debian/pool/main/j/jotta-cli/jotta-cli_${pkgver}_armhf.deb")
source_aarch64=("https://repo.jotta.us/debian/pool/main/j/jotta-cli/jotta-cli_${pkgver}_arm64.deb")

sha256sums_x86_64=('c51a7f8492e1f442b999bc642243d51d5e454dc6a772ca2758cf956f39e75349')
sha256sums_i686=('60c10b922b6c4da6fdc17718b6505646c72164e0b5b5070e8d5b2fd605e60b72')
sha256sums_armv7h=('d4b3e287d81c1f12d600986e33aef1cbb559d8eaccca0bb0b6aa27645ef04513')
sha256sums_aarch64=('11b44ea04a37f447841685309f5ad21494beee565031f87be31a8cb905c65b89')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

