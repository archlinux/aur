# Contributor: Lēctia (Eden) Landau <lectia@wizard.enterprises>
# Maintainer: tee < teeaur at duck dot com >
pkgname=anywherelan-bin
pkgver=0.20.0
pkgrel=1
pkgdesc="Peer-to-peer mesh VPN and socks5 proxy (CLI/server version, prebuilt)"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/anywherelan/awl"
license=('MPL-2.0')
provides=('anywherelan')
conflicts=('anywherelan')
source_x86_64=("$url/releases/download/v$pkgver/awl-linux-amd64-v$pkgver.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/awl-linux-arm64-v$pkgver.tar.gz")
source_armv7h=("$url/releases/download/v$pkgver/awl-linux-arm-v$pkgver.tar.gz")
source_i686=("$url/releases/download/v$pkgver/awl-linux-386-v$pkgver.tar.gz")
b2sums_x86_64=('1b0951121224215019ac794e4f91b858597506e4d5d1aea5541decaddfbe3cfa6ba7d12ce5c61b38dfcc10a639bf945a7c32556db12c928e817476a314186ca5')
b2sums_aarch64=('b8c4b78d3b63030d6e6a8e1a08dd855cba8e3efdd5ccd21abbea41609d7eaaf45870658852efcc2702cf55458090dc5034cfa683de9bdf35e078849bac307055')
b2sums_armv7h=('6ecc54972617a39580bef76372349418eb22dac4e11f6b914d751a29d4220fcf97de81ae85533f16f84ff56ea103c5f2a25bc1f427ade5ba63b840517f11acca')
b2sums_i686=('98aeb685b7415248411ccfb57357a823a30f42d535f75920228d0d15cc244d847ec2dca8f8862d6e55e5c782b97a7de7863797e5b7ae04753d4dc6f9d9f14a09')

package() {
  install -Dm755 awl "$pkgdir/usr/bin/awl"
}
