# Maintainer: noctulus <fangyuhao0612@gmail.com>
pkgname=intel-mlc
pkgver=3.13
pkgrel=1
pkgdesc="Intel® Memory Latency Checker (Intel® MLC) is a tool used to measure memory latencies and b/w, and how they change with increasing load on the system."
arch=('x86_64')
url="https://www.intel.com/content/www/us/en/developer/articles/tool/intelr-memory-latency-checker.html"
license=("LicenseRef-custom")
install="${pkgname}.install"
source=("https://downloadmirror.intel.com/926327/mlc_v${pkgver}.tgz")
sha256sums=('A8537E8FF3FAD626D75A383FABC224CCC4CC98A0111C9989F7FB26B639F12019')

package() {
	cd "${srcdir}"
	install -Dm755 Linux/mlc -t "${pkgdir}/"usr/bin
	install -Dm644 "Intel Memory Latency Tools Outbound License Agreement.pdf" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
