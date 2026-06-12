# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=darklua-bin
pkgver=0.19.0
pkgrel=1
pkgdesc='Transform Lua 5.1 and Roblox Luau code using configurable rules.'
url='https://github.com/seaofvoices/darklua'
license=('MIT')
depends=('glibc' 'gcc-libs')
arch=('x86_64' 'aarch64')
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/darklua-linux-x86_64.zip")
source_aarch64=("$url/releases/download/v$pkgver/darklua-linux-aarch64.zip")
sha256sums_x86_64=('353b7a7772cec97994fd991fb3c143b39654ff154bd6dabfd7abf9fbe9ab7ea8')
sha256sums_aarch64=('b308a5724b4781e89fbac42bd5906342d9ea0374961d64b8b5f0681bba2cdcac')

package() {
  install -Dm755 darklua "$pkgdir/usr/bin/darklua"
}
