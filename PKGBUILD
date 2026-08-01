# Maintainer: Boyke Tegar <works@boytegar.xyz>
pkgname=pcb-bin
pkgver=1.22.1
pkgrel=1
pkgdesc="A fast, open agent harness for the terminal — single Go binary, ~12MB, zero runtime deps"
arch=('x86_64' 'aarch64')
url="https://github.com/boytegar/packboy-builder"
license=('Apache-2.0')
provides=('pcb')
conflicts=('pcb' 'pcb-git')
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/packboy-builder_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/packboy-builder_linux_arm64.tar.gz")
sha256sums_x86_64=('f1f9bba2aa98c279d5639460c7d027c1910090fa624c7c584c40b19c1d213cb9')
sha256sums_aarch64=('706e32ff04911b3a20c2cfc803c30c9d1b4d01e8b69f2f571e6a6a37e41c54ea')

package() {
    install -Dm755 pcb "$pkgdir/usr/bin/pcb"
}
