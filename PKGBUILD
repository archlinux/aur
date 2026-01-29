# Maintainer: Liam (DigitalEncryption/SelfhostedGuy)
# hello@selfhostedguy.com
pkgname=distroupdater
pkgver=3.0
pkgrel=1
pkgdesc="Cross-distro system updater (Arch, Debian, Fedora, Termux)"
arch=('any')
url="https://github.com/digitalencryption/DistroUpdater"
license=('MIT')
depends=('python' 'unzip')
source=("https://github.com/digitalencryption/DistroUpdater/releases/download/$pkgver/DistroUpdaterV3.zip")
sha256sums=('SKIP')

package() {
    # Extract the ZIP to a temporary folder
    unzip -o "DistroUpdaterV3.zip" -d "$pkgdir/tmp"

    # Install the Python script to /usr/bin
    install -Dm755 "$pkgdir/tmp/DistroUpdaterV3.py" \
        "$pkgdir/usr/bin/distroupdater"


}
