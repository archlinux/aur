# Maintainer: DecDuck <declanahofmeyr@gmail.com>
# Maintainer: quexeky <git@quexeky.dev>

pkgname=drop-oss-app-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="The client application for the open-source, self-hosted game distribution platform Drop"
arch=(x86_64)
conflicts=('drop-oss-app')
url="https://droposs.org/"
license=('LicenseRef-GPL-3.0')
depends=('glib2' 'glibc' 'gcc-libs' 'openssl')
makedepends=('unzip')
makedepends=()
source=("https://github.com/Drop-OSS/drop-app/releases/download/v0.2.0-beta/Drop.Desktop.Client_0.2.0-beta_amd64.deb")
sha256sums=('7a2263c142b1a2cefdd4d1b9bcd94c161919a9beb53dcbf4a1a6eac05660829f')

prepare() {
        tar -zxvf data.tar.gz
}

package() {
        cp -r "$srcdir/usr" "$pkgdir"
}
