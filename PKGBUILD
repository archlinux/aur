# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.15.78571'
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

sha256sums_x86_64=('9398a5c542b897bc7e97bd63becbcd20ac1860e2091711323868252b04df71fe')
sha256sums_i686=('ab981132473ea00e1ea32ccc28a83fd545ee7e821f37dd336b39eda6b8ef1010')
sha256sums_armv7h=('11a2b31e9273d4f2400a9ac4d665a0b8752a70aafbf0ac69ae137c39efd36925')
sha256sums_aarch64=('a6eb61bd3dcbcd22535401fdd31fac169eb36978d84db95c05aa3067642a91b3')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

