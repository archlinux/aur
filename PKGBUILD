# Maintainer: noctulus <fangyuhao0612@gmail.com>
pkgname=intel-mlc
pkgver=v3.11b
pkgrel=1
pkgdesc="Intel® Memory Latency Checker (Intel® MLC) is a tool used to measure memory latencies and b/w, and how they change with increasing load on the system."
arch=('x86_64')
url="https://www.intel.com/content/www/us/en/developer/articles/tool/intelr-memory-latency-checker.html"
license=("LicenseRef-custom")
install="${pkgname}.install"
source=("https://downloadmirror.intel.com/834254/mlc_${pkgver}.tgz")
sha256sums=('5d5abd27d145af59d564c9c53938301a08205f075b9bd41f2f92b4c8efeb2824')

package() {
	cd "${srcdir}"
	install -Dm755 Linux/mlc -t "${pkgdir}/"usr/bin
	install -Dm644 "Intel Memory Latency Tools Outbound License Agreement.pdf" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
