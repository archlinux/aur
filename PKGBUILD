# Maintainer: alphazo <dexios-8362@notracking.email>
pkgname=dexios-bin
pkgver='8.8.1'
pkgrel=2
pkgdesc="Dexios is a fast, secure, and open source command-line encryption tool. It's written entirely in Rust and uses modern cryptographic AEADs (XChaCha20-Poly1305 + AES-256-GCM), with audited backends."
url="https://github.com/brxken128/dexios"
source_x86_64=( "https://github.com/brxken128/dexios/releases/download/v$pkgver/dexios-linux-amd64" )
arch=('x86_64')
license=('BSD 2-Clause License')
depends=()
optdepends=()
sha256sums_x86_64=(  '477bfa3ed25b45ead2291af1214ff2631b6c94e644fe7fe70a8bb2d424639aa4' )

package() {
  cd "$srcdir"

  install -Dm755 dexios-linux-amd64 "${pkgdir}/usr/bin/dexios"
}
