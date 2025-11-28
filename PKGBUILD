# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=darklua-bin
pkgver=0.17.3
pkgrel=1
pkgdesc='Transform Lua 5.1 and Roblox Luau code using configurable rules.'
url='https://github.com/seaofvoices/darklua'
license=('MIT')
depends=('glibc' 'gcc-libs')
arch=('x86_64' 'aarch64')
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/darklua-linux-x86_64.zip")
source_aarch64=("$url/releases/download/v$pkgver/darklua-linux-aarch64.zip")
sha256sums_x86_64=('389d131279d87e2970b57a26e35276babd78dd16273a730a4370d3646b6f3198')
sha256sums_aarch64=('2cb1f0948d04f76068bd26d096a0f6a583d9531548a7c5a10360c7b510f4792f')

package() {
  install -Dm755 darklua "$pkgdir/usr/bin/darklua"
}
