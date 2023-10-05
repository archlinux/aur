# Maintainer: Jottacloud Packaging Team <packaging at jottacloud dot com>
# Contributor: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver='0.15.93226'
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

sha256sums_x86_64=('06f6522f5b37a2fd955d1b4289c06eba7d81c9387f3e1e71c103053dbf67622b')
sha256sums_i686=('70ab8f0963c050cfc15f26d6089d73fb676fce9f48d00b6a0f5ff202a696231e')
sha256sums_armv7h=('975655ce023bf1d086c5bda16d8aaf4d7e794b5ba4d9886a49fffba2ded41e02')
sha256sums_aarch64=('ee2ef694d24e0e607a02a9ac16835d937a59e04c1f76e0126e0eb8eb356136eb')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

