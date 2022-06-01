# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.14.58899'
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

sha256sums_x86_64=('5f5d181b5145e9ce4eafbdd658ad0a3d4ccf5ca3ab080131a5b50d68f7df8250')
sha256sums_i686=('333a52d2e02016ca00fdbf4d07b1f3f9fc7d0f077a017a6adba5b4ebf831e602')
sha256sums_armv7h=('87b008090f7e04a485fff1ef5504b63f27ca3fa0b0066601082990101c18ff7a')
sha256sums_aarch64=('04b7e863daf7e5cd11f0fb388a853a3b1a25173c770d9663406612d44fc3793c')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

