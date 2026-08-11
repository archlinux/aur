# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.17.176206'
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

sha256sums_x86_64=('590cbabe69b249e6881d78f42640ff7163f8e4a380d4a11b26856ec6439119fd')
sha256sums_i686=('d4e34b3c94cf41bbb7b26a9136acaa500ea3de5e2c1a5fa8e400f51882fd108d')
sha256sums_armv7h=('d11d71f9a2e68e5f7de36db631e51d5cf04aac12d4044f8399374e29b0415416')
sha256sums_aarch64=('c5d3b5c4d039aa33b75d025545466a13f2d05b293540ca04f171a79162b0bab4')

package() {
  bsdtar -xf data.tar.* -C "$pkgdir/"
}

