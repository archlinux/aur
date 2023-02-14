# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.15.75295'
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

sha256sums_x86_64=('8dad8873eaa8a40f99b631a1da22da2e7364aba4db48b4bca6fae52ce35c8a64')
sha256sums_i686=('4d55a209c2dfc9aa8c227c23f80ac40cbeb498c90b4c019ecbc24809727d68af')
sha256sums_armv7h=('c3d823e5f1f1730c593aa69a9412686de07152a9b47be664b0ba3254d7838a22')
sha256sums_aarch64=('14351bf1942e230c70e0de4e069b7461201ff4416ffd48ea8b54440e018cf413')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

