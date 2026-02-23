# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.17.158308'
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

sha256sums_x86_64=('75e4083384fc65c585028a7a7b10a1860eaa3a637e8b5c8e126cc6bcf9fcb3d3')
sha256sums_i686=('08b314ed19f48a21fddb77e772ffe6a31cba4331b8b2e56d7fc49694ce1d78e7')
sha256sums_armv7h=('9018e5dfd536e5510b4beab631a213a1811c4e5a0924805628780ced57c33ed7')
sha256sums_aarch64=('74caa15ff8a2eb3fca7e9b478035133b34359489402446637e925346a730c694')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

