# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.16.129390'
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

sha256sums_x86_64=('7c536bf28553ab6a4757f8e69c90967e5bcd3449e8a9b71f7b73b2b0703283f7')
sha256sums_i686=('cb0ea526089fd1465cefdbb244082e3c45b7f5475367eae2f2f0f4e374a34c03')
sha256sums_armv7h=('d14f693b811127902ae83baff832b339843188d179d465744a6cc5eac0c976cc')
sha256sums_aarch64=('179aa7e19e301bbb4b520c2d2b8a4f0468740a87f67346257b994bc409c30348')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

