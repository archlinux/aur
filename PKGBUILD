# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.15.98319'
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

sha256sums_x86_64=('fa1585b93ba5b9d209d1f169000ec321bc3db1ba1ed1cf07fcf043e065ebb489')
sha256sums_i686=('0c920bfee132a0305ee1d1d4c63e134bc69a820cec7fd5ff26b870ff4727e4f9')
sha256sums_armv7h=('a53c7882999a71203bae74d15fba085f9338f02ebd156e292201905acded7ba7')
sha256sums_aarch64=('d28b437635e95116d882ef569aab54cc2ee36f560987d31ce3212ed963ebc7f8')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

