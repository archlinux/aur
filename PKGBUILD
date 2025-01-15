# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.16.126924'
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

sha256sums_x86_64=('aa3938eeef132bf580395a0dc9f7693733adaad0cd0c23014eb04e7f93ef3352')
sha256sums_i686=('7add97e3ddafdb6dd9eb5f08c5f6adf783bc7313d11a1e147cb19fe9930b7ea3')
sha256sums_armv7h=('589c31f5d7a0bb4dd062f6b3df32ad6a6bc33c9b764333ced48fee41a2adcdbd')
sha256sums_aarch64=('1408709f37b912d1b84ae0b5c84860edeb1355bf508de271d0f9158a0b8fc0ff')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

