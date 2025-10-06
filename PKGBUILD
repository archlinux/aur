# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=darklua-bin
pkgver=0.17.2
pkgrel=1
pkgdesc='Transform Lua 5.1 and Roblox Luau code using configurable rules.'
url='https://github.com/seaofvoices/darklua'
license=('MIT')
depends=('glibc' 'gcc-libs')
arch=('x86_64' 'aarch64')
source_x86_64=("$url/releases/download/v$pkgver/darklua-linux-x86_64.zip")
source_aarch64=("$url/releases/download/v$pkgver/darklua-linux-aarch64.zip")
sha256sums_x86_64=('a62f99863049ab9ec8b90ac710965a7bed5f2419b61bfc42a4afa49cfa90372e')
sha256sums_aarch64=('ea48cf961552974eb79e312264b3fb6c2d0d405b5a8a8251c40c71ca2017f757')

package() {
	install -Dm755 darklua "$pkgdir/usr/bin/darklua"
}
