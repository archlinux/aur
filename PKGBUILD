# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.14.60923'
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

sha256sums_x86_64=('99bd388d892a66f1a88302ccd2c748b26386914bbb4d7488e391dfc6f7780c0f')
sha256sums_i686=('c3f124bd8ac7abb97ca0e377bb7bc480857e2c42360289d80a07c94c0b9658d2')
sha256sums_armv7h=('30013c17252495902bdbc924b87d34eb2e372dc0dffaff0a7d59f4d21ed57057')
sha256sums_aarch64=('32da88c9a9a4bce1213260314472b9d7b3d18f3454bb2eac6dbd24e686bb6031')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

