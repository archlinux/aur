# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.15.75988'
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

sha256sums_x86_64=('d616603ec15c67bd29f67ca75181b3989d0cbd271f9ab23b71b4f0be6ad7231d')
sha256sums_i686=('8c2987069811a8c89e89c8c1b925df157246e752d13ce946447f57c31f7b2039')
sha256sums_armv7h=('9fd8fb974f2a8bb7aa80744560b93209eaf8e4e879732b65f1ca9b226f071139')
sha256sums_aarch64=('6190e5b5b2ebae0c26f353dfba980b9e2f464bece939c24a56a3237086fae0c3')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

