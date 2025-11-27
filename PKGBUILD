# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.17.148769'
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

sha256sums_x86_64=('734e5c6c41920da039f679a37b888b540fc772bdf6c9ec59e10581301843ed8a')
sha256sums_i686=('832980bba4c32ec145634dc1458e12f6ee2b04267809aafdc8af281d38871a86')
sha256sums_armv7h=('8781808fa776c5a765fe7f9aa336c90b1a059789c0600286c4ca3b358ebcf778')
sha256sums_aarch64=('fa30c3b75a76ad42653f58fa75c96222784ad1a20fb8609e567c15534806f837')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

