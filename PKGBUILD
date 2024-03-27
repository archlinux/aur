# Maintainer: Meow King <mr.meowking@anche.no>
pkgname=zls-nightly-bin
pkgver="0.12.0"
pkgrel=1
pkgdesc="A Zig language server. [YOU MUST USE ZIG MASTER VERSION]"
arch=('x86_64' 'x86' 'aarch64')
url="https://github.com/zigtools/zls/wiki/Installation"
license=('MIT')
provides=('zls')
conflicts=('zls')
source_x86_64=("https://zigtools-releases.nyc3.digitaloceanspaces.com/zls/master/x86_64-linux/zls")
source_x86=("https://zigtools-releases.nyc3.digitaloceanspaces.com/zls/master/x86-linux/zls")
source_aarch64=("https://zigtools-releases.nyc3.digitaloceanspaces.com/zls/master/aarch64-linux/zls")
sha256sums_x86_64=('f561c6757ad05bc0287699bfc3f117833932210cce3701969ca94f37b7e52721')
sha256sums_x86=('f561c6757ad05bc0287699bfc3f117833932210cce3701969ca94f37b7e52721')
sha256sums_aarch64=('f561c6757ad05bc0287699bfc3f117833932210cce3701969ca94f37b7e52721')

package() {
    install -Dm755 ./zls "$pkgdir/usr/bin/zls"
}
