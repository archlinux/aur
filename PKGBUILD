# Maintainer: DecDuck <declanahofmeyr@gmail.com>
# Maintainer: quexeky <git@quexeky.dev>

## How to update
# Update source and sha256sum

pkgname=drop-oss-app-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="The client application for the open-source, self-hosted game distribution platform Drop"
arch=(any)
conflicts=('drop-oss-app')
url="https://droposs.org/"
license=('LicenseRef-GPL-3.0')
depends=('glib2' 'glibc' 'gcc-libs' 'openssl' 'webkit2gtk-4.1' 'umu-launcher')
makedepends=('unzip')
makedepends=()
source=('https://github.com/Drop-OSS/drop-app/releases/download/v0.3.3/Drop.Desktop.Client_0.3.3_amd64.deb')
sha256sums=('c3da6761db3c9bc0c04b3083377069f9417509cad6db81b6ef838b55d9f32242')

prepare() {
        tar -zxvf data.tar.gz
}

package() {
        cp -r "$srcdir/usr" "$pkgdir"
}
