# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.15.110283'
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

sha256sums_x86_64=('49a223f1b8871e64bc6ed082d7d7125644ff6059fe99d80064e4e4b90d93181a')
sha256sums_i686=('c1871cf142f9fe2cb681e7246678226c495b8a35fb72cb7907a47b9866d83824')
sha256sums_armv7h=('d16488fa0b286c4075d6eb3672b6aec25f472a6fa0717c509c1413275027aae1')
sha256sums_aarch64=('ac05705a517651483cd7bfec334381bf557ba29ace510e176b7dd23a147a63aa')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

