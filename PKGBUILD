pkgname=cefdetector-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Check how many CEFs are on your Linux."
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/CefDetectorLinux"
license=('MIT')
depends=('webkit2gtk-4.1' 'fd')
provides=('cefdetector')
conflicts=('cefdetector')
source=("CefDetector_0.1.6_amd64.deb::https://github.com/Tobiichi-Origuchi/CefDetectorLinux/releases/download/v0.1.6/CefDetector_0.1.6_amd64.deb")
sha256sums=('6f6d63cefc512df5521fb83603e9c8ed61596500b2fc906f87c95b5a3f8cca58')

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
