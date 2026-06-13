pkgname=cefdetector-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Check how many CEFs are on your Linux."
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/CefDetectorLinux"
license=('MIT')
depends=('webkit2gtk-4.1' 'fd')
provides=('cefdetector')
conflicts=('cefdetector')
source=("CefDetector_0.1.5_amd64.deb::https://github.com/Tobiichi-Origuchi/CefDetectorLinux/releases/download/v0.1.5/CefDetector_0.1.5_amd64.deb")
sha256sums=('ec66ea47246be18f577bd2a480e3e61b4853275bf5603d4c0caf364ffacc3923')

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
