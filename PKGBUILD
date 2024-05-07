# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.15.109064'
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

sha256sums_x86_64=('b7b2cbc5856fa724a7b2177755f8031c18322288e75ea5517b1d231747a01843')
sha256sums_i686=('9d552d1738dc150a09db76695abd24a1174dd20cf87b5051085c2c63e8feab94')
sha256sums_armv7h=('1e9523201643e97dcf31bbbf5719345945e6b416ba3cb69b09c3d4119821045d')
sha256sums_aarch64=('8c1e3692608f8e01d50886883572697e35c2b745c37ef5f679235b406ad7ce04')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

