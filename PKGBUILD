pkgname=cefdetector-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Check how many CEFs are on your Linux."
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/CefDetectorLinux"
license=('MIT')
depends=('webkit2gtk-4.1')
provides=('cefdetector')
conflicts=('cefdetector')
source=("CefDetector_0.1.4_amd64.deb::https://github.com/Tobiichi-Origuchi/CefDetectorLinux/releases/download/v0.1.4/CefDetector_0.1.4_amd64.deb")
sha256sums=('dfa8976638539eb5a1fee962dd841e033c9fcedbc94c06772f40353afb44e056')

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
