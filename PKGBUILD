# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=connectiq-sdk-manager
pkgver=7.1.1
pkgrel=1
pkgdesc="Garmin Connect IQ SDK Manager"
arch=('x86_64')
url="https://developer.garmin.com/connect-iq/sdk/"
license=('MIT')
source=(https://developer.garmin.com/downloads/connect-iq/sdk-manager/connectiq-sdk-manager-linux.zip)
sha256sums=('34c9d5754813e44739734ebf3b17e6189aee3bca6dd4c339b37f02e975aebcfe')
package() {
    cd "$srcdir"

    install -D -m755 bin/sdkmanager $pkgdir/usr/bin/$pkgname

    install -dm755 $pkgdir/usr/share/$pkgname
    cp -dr --no-preserve=ownership share/sdkmanager/* $pkgdir/usr/share/$pkgname/
}
