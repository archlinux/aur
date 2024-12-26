# Maintainer: DecDuck <declanahofmeyr@gmail.com>
# Maintainer: quexeky <git@quexeky.dev>

pkgname=drop-oss-app-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="The client application for the open-source, self-hosted game distribution platform Drop"
arch=(x86_64)
url="https://droposs.org/"
license=('LicenseRef-GPL-3.0')
depends=('glib2' 'glibc' 'gcc-libs' 'openssl')
makedepends=('unzip')
makedepends=()
source=("https://github.com/Drop-OSS/drop-app/releases/download/v0.1.0-beta/Drop.Desktop.Client_0.1.0_amd64.deb")
sha256sums=(325f024aadbc7c9c3a0b3789413220983f4503ed0987b1acea0d742f175a4944)

prepare() {
        tar -zxvf data.tar.gz
}

package() {
        cp -r "$srcdir/usr" "$pkgdir"
}
