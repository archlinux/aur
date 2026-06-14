pkgname=cefdetector-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Check how many CEFs are on your Linux."
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/CefDetectorLinux"
license=('MIT')
depends=('webkit2gtk-4.1' 'fd')
provides=('cefdetector')
conflicts=('cefdetector')
source=("CefDetector_0.1.7_amd64.deb::https://github.com/Tobiichi-Origuchi/CefDetectorLinux/releases/download/v0.1.7/CefDetector_0.1.7_amd64.deb")
sha256sums=('62660d2395d85240c4fa75ed63e1d42700563dc89897aa9f65fbdcfdc829225d')

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
