# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Ashwin Vishnu <ashuwish+arch at gmail dot com>

pkgname=sendanywhere
pkgver=8.2.13
pkgrel=1
pkgdesc="Send Anywhere is a multi-platform file sharing service where users can directly share digital content in real time."
arch=('x86_64')
url="http://send-anywhere.com"
license=('custom:sendanywhere_eula')
options=('!strip' '!emptydirs')
depends=('gtk3')
source=('https://update.send-anywhere.com/linux_downloads/sendanywhere_latest_amd64.deb')
sha512sums=('294525a6440a8eb7a263993ee655a57b1f40c76c476e231ec1b974e8a3a85dfdc763555be368e200a21d065746f2e271855ee34a6107e308618b6cdd0d1a0532')

package(){
    tar xf data.tar.xz -C "$pkgdir"

    install -Dm644 "$pkgdir/opt/SendAnywhere/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    install -Dm644 "$pkgdir/opt/SendAnywhere/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
