# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=solana-bin
pkgver=1.5.10
pkgrel=1
pkgdesc='Binaries for the Solana blockchain'
arch=('x86_64')
url='https://github.com/solana-labs/solana'
license=('GPL3')
provides=('solana')
conflicts=('solana')
options=(!strip)
depends=('openssl' 'systemd-libs')

source=("https://github.com/solana-labs/solana/releases/download/v${pkgver}/solana-release-x86_64-unknown-linux-gnu.tar.bz2")
md5sums=('9ff2cc254adfde7f352976f28c56e27f')

package() {
  cd ${srcdir}
  mkdir -p "${pkgdir}/opt"
  cp -a solana-release "${pkgdir}/opt"
}
