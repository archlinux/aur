# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.15.91862'
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

sha256sums_x86_64=('99e552d0c4843343f87911fe7910cefd79db06dec0c150f1884b60d29392a01e')
sha256sums_i686=('76bc6d170b96e21a675af4b4efd93d4bca1c7e0718a2f2eaec2050300cbca46e')
sha256sums_armv7h=('9049ddfda6254126cd8a00541d89fa70d31ae78fa8444f48ae4f9acb18043891')
sha256sums_aarch64=('344cb8e67bf0ae89892a2adf88cc4a139d4477d48ec9c9877d7d9bb7a374fde6')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

