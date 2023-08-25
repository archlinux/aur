# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.15.89752'
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

sha256sums_x86_64=('f879c28426bc3c716154a3eca093f737300934eff1519a94965c60a584ca82a8')
sha256sums_i686=('62a64c047362172f757e1e137ff8ea8f06a3a86f32d138c2d7e9343f3ec546eb')
sha256sums_armv7h=('4f0c940b8858e5cde389e10c532625f3c553cb6cb38f8dc3829f258a78ba0045')
sha256sums_aarch64=('67f47ded1ebc5c6fc8c5a6263cef716d2668ea7dbb981408affd2a29f2b3cc1c')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

