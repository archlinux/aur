# Maintainer: DecDuck <declanahofmeyr@gmail.com>
# Maintainer: quexeky <git@quexeky.dev>

pkgname=drop-oss-app-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="The client application for the open-source, self-hosted game distribution platform Drop"
arch=(x86_64 aarch64)
conflicts=('drop-oss-app')
url="https://droposs.org/"
license=('LicenseRef-GPL-3.0')
depends=('glib2' 'glibc' 'gcc-libs' 'openssl' 'webkit2gtk-4.1' 'umu-launcher')
makedepends=('unzip')
makedepends=()
source=("https://github.com/Drop-OSS/drop-app/releases/download/v0.3.0/Drop.Desktop.Client_0.3.0_amd64.deb")
sha256sums=('844a06a6292eeb7b2a7597f5ecb71a5d07bf3b573e2abb67c89f5fb0da69eaa0')

prepare() {
        tar -zxvf data.tar.gz
}

package() {
        cp -r "$srcdir/usr" "$pkgdir"
}
