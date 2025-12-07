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
sha256sums=('6473ced0769f64ec2c901f2718dda60c86ec4e09c4f89fbf6acfce1b0bb99d19')

prepare() {
        tar -zxvf data.tar.gz
}

package() {
        cp -r "$srcdir/usr" "$pkgdir"
}
