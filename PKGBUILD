# Maintainer: Emil Bay <archlinux@tixz.dk>
# Contributor: Ramana Kumar <ramana@member.fsf.org>
# Contributor: JP-Ellis <josh@jpellis.me>
pkgname=lighthouse-ethereum-bin
_pkgname=lighthouse
pkgver=5.1.1
_pkgver=5.1.1
pkgrel=2
pkgdesc='Ethereum 2.0 client'
arch=('x86_64' 'aarch64')
url='https://lighthouse.sigmaprime.io/'
license=('Apache-2.0')
depends=('openssl')
provides=('lighthouse')
conflicts=('lighthouse')
source=("https://raw.githubusercontent.com/sigp/lighthouse/stable/LICENSE")
source_x86_64=("https://github.com/sigp/lighthouse/releases/download/v${_pkgver}/lighthouse-v${_pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/sigp/lighthouse/releases/download/v${_pkgver}/lighthouse-v${_pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('91d7b651aa6c6ffe6c36445f2652b49ff86134f6dc558a8bf35a8d407dfe2578')
sha256sums_x86_64=('2be6ad1238c40f6a8fbf77ecd89b499b66607cb61305280ca0e427503a5daa3a')
sha256sums_aarch64=('50648c57ff7e18dc671d649b07b3f61545baca7bba09eb6dcaef904c0970c507')

package() {
    install -D -m755 "$srcdir/lighthouse" "$pkgdir/usr/bin/lighthouse"
    install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
