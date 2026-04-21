# Maintainer: beeender <chenmulong@gmail.com>
pkgname=tryto-bin
_pkgname=tryto
pkgver=0.1.0
pkgrel=1
pkgdesc="Describe your needs, shell like a guru. Natural language to shell command converter."
arch=('x86_64')
url='https://github.com/beeender/tryto'
license=('MIT')
provides=('tryto')
conflicts=('tryto')

source_x86_64=("$url/releases/download/v$pkgver/tryto_v${pkgver}_x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('6fdb74359b70c660a47ab4d22821cd3683ce1cd6a16f4a1a5b65b540d709ecb9')

package() {
  tar -xzf "tryto_v${pkgver}_x86_64-unknown-linux-musl.tar.gz"
  install -Dm755 "tryto" "$pkgdir/usr/bin/tryto"
}
