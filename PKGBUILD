pkgname=cefdetector-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Check how many CEFs are on your Linux."
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/CefDetectorLinux"
license=('MIT')
depends=('webkit2gtk-4.1')
provides=('cefdetector')
conflicts=('cefdetector')
source=("CefDetector_0.1.8_amd64.deb::https://github.com/Tobiichi-Origuchi/CefDetectorLinux/releases/download/v0.1.8/CefDetector_0.1.8_amd64.deb")
sha256sums=('a679031864b6813d51825d7ef566f001d9e830ad475c8c870b1176aaef3ba5d5')

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
