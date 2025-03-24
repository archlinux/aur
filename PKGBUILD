# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.17.132497'
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

sha256sums_x86_64=('fc638b9993240e1213496c57d1a8427713462e005e07f1f3bd3ee01de2593519')
sha256sums_i686=('b7625b741228b155c04b2b8e536f4936a0510087329276d560ece463b5ddca7b')
sha256sums_armv7h=('3954d403804d0bf9174e51cc7d59ff3ffc7c2c6e24d593a485cadd89ab320f1d')
sha256sums_aarch64=('3c16620caa2005c5905a9791bc9aec19852cf84a8af6fcafa06c150fa812f61c')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

