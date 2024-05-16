# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.15.109709'
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

sha256sums_x86_64=('d5f6a2828a642b02f4c49a57e788e5a86295aa03a0b5765e79f86c37d676e3d9')
sha256sums_i686=('009b2e11e040cb2da34c102a8ef36f759d0040fc3ae7e63c8e615fed552c4a73')
sha256sums_armv7h=('3f4f60bbb3459ddf6c1a6a0fd084374cdf236d9e985a362f3f3f07b29d985e88')
sha256sums_aarch64=('c1fb68c2bc896e68a57ea0bcb8da660b6f7879c71e336b188f4014cb5c2e14a7')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

