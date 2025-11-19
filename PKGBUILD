# Maintainer: DecDuck <declanahofmeyr@gmail.com>
# Maintainer: quexeky <git@quexeky.dev>

## How to update
# Update source and sha256sum

pkgname=drop-oss-app-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="The client application for the open-source, self-hosted game distribution platform Drop"
arch=(any)
conflicts=('drop-oss-app')
url="https://droposs.org/"
license=('LicenseRef-GPL-3.0')
depends=('glib2' 'glibc' 'gcc-libs' 'webkit2gtk-4.1' 'umu-launcher' 'libappindicator' 'libayatana-appindicator')
makedepends=('unzip')
source=('https://github.com/Drop-OSS/drop-app/releases/download/v0.3.4/Drop.Desktop.Client_0.3.4_amd64.deb')
sha256sums=('c40a9e37db92614396af4eee811e00d268150314b644fef839de8d4b7b8b3963')

prepare() {
        tar -zxvf data.tar.gz
}

package() {
        cp -r "$srcdir/usr" "$pkgdir"
}
