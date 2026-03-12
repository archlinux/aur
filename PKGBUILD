# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.17.159692'
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

sha256sums_x86_64=('ae7174df2d7cbcfb5a68baefc74564f75d41ef1ea9050da269ee72b22a90510c')
sha256sums_i686=('b4bca3f9effc4be121053fe4d349babf6ea886478dfd2ca872e94ad3f1a32a63')
sha256sums_armv7h=('4208a009f24f6aedd4095d3c473d1f195ef77c35fafdad7cf113203942450f69')
sha256sums_aarch64=('9b7a8443a2fff600500331db0ac05662596a3989c65d54b09b02fd5c07839074')

package() {
  bsdtar -xf data.tar.* -C "$pkgdir/"
}

