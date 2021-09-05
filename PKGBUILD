# Maintainer: hockeymikey <hockeymikey@hockeymikey.com>
pkgname=vertcoin-qt-bin
pkgver=0.17.1
pkgrel=3
pkgdesc="A digital currency with mining decentralisation and ASIC resistance as a key focus."
arch=('x86_64')
url="https://github.com/vertcoin-project/vertcoin-core"
license=('MIT')
source=("https://github.com/vertcoin-project/vertcoin-core/releases/download/$pkgver/vertcoin-qt-v$pkgver-linux-amd64.zip"
        "https://github.com/vertcoin-project/vertcoin-core/releases/download/$pkgver/vertcoin-qt-v$pkgver-linux-amd64.zip.sig")
sha256sums=('d0721a1d0cfbe8bbba9f9feabc4a7dd167fd05a67d54afc1cd67660a89a11b9d'
            'SKIP')
validpgpkeys=('64D9042053AA1391D6C0B4A7425776E2F9E5BAB8')
provides=('vertcoin-qt')
conflicts=('vertcoin-qt')

package() {
	set -eu
	install -Dm755 vertcoin-qt "$pkgdir/usr/bin/vertcoin-qt"
}
