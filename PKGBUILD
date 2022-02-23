# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.13.56239'
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

sha256sums_x86_64=('62bd1b8a5bb910ad726d141569d8204399d1f9aa6661a51ae69e1a5ccf8aa366')
sha256sums_i686=('ef0cc35655b649e11035a440ebf7d6d41039612d89a48bda738f15c6be7dd871')
sha256sums_armv7h=('19604ae848d371a715a2f1c0e073faba90a375e89423f31351260a26dfae8f8a')
sha256sums_aarch64=('e11d123814a7f51d13933d1b1e7f152888ed70f2ed9e58c1f1a3cd987e6eae4e')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

