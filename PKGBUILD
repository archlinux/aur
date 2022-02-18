# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.13.55213'
pkgrel=2
pkgdesc='Jottacloud backup and sync. Whether you are an individual, family or business, Jottacloud lets you store, share and be productive wherever you are.'
url='https://www.jottacloud.com/'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('custom: Copyright Jotta AS')
conflicts=('jotta-cli-beta')
install='jotta-cli.install'

source_x86_64=("https://repo.jotta.us/debian/pool/main/j/jotta-cli/jotta-cli_${pkgver}_amd64.deb")
source_i686=("https://repo.jotta.us/debian/pool/main/j/jotta-cli/jotta-cli_${pkgver}_i386.deb")
source_armv7h=("https://repo.jotta.us/debian/pool/main/j/jotta-cli/jotta-cli_${pkgver}_armhf.deb")
source_aarch64=("https://repo.jotta.us/debian/pool/main/j/jotta-cli/jotta-cli_${pkgver}_arm64.deb")

sha256sums_x86_64=('3562346b5aa7df5eabaed549849bd4bf0f6e3e9a84c112579f5aeac20d886e47')
sha256sums_i686=('f85e873b5515e7554ecb3decb28273ccdaa7dd416735506bc0cbc8368740b7cc')
sha256sums_armv7h=('6ae3bb6bc2b15d708b80a36de3898cbc95c8177d150605af35cb278f9330c6c9')
sha256sums_aarch64=('57be47d57d8eea106eb10a940dfce057a80180e7e84ea5aab9f95ffd7099b495')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

