# Maintainer: Eliot_Alderson <eliotjoking at gmail dot com>

pkgname=git-koji-bin
_pkgname=koji
pkgver=3.3.1
pkgrel=1

url='https://github.com/cococonscious/koji'
pkgdesc='An interactive CLI for creating conventional commits.'
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('git')
provides=('koji')

source_x86_64=("https://github.com/cococonscious/koji/releases/download/v$pkgver/koji-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/cococonscious/koji/releases/download/v$pkgver/koji-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c09175ab8ea0a20d7b7d225d123fb2180e51bb4bf7fb0837c9bfd41afd0bbe45')
sha256sums_aarch64=('e5a0ebbaac9f2bc7b50e4a5749f19cdc95ee96cf9344a3bd9a8b32b410f2d707')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "$pkgdir/usr/bin/$_pkgname"
}
