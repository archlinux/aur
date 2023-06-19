# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.15.84961'
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

sha256sums_x86_64=('456c048e5c76b4a5658cc171c7ccfbe9ad641e611307754fb1b2f1bab5f5a7d3')
sha256sums_i686=('6112376b5ee0d11724688df46585d3e533981acf95b70837089aa8f8f1073dee')
sha256sums_armv7h=('d885eaadf44dad23dfa9ee4c74240f6256f7ddefedc7902e50f462f040c880c2')
sha256sums_aarch64=('8bcb0c00dc2416dbcd10342a0f7327bf8b8631296761f3f8f0f912a4a45de308')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

