# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=micron-storage-executive-cli
pkgver=11.01.012025.00
pkgrel=1
pkgdesc="Micron Storage Executive Command Line (msecli) for configuring and managing Micron SSDs"
arch=(x86_64)
url="https://www.micron.com/sales-support/downloads/software-drivers/storage-executive-software#cli"
license=()
makedepends=()
optdepends=()
source=(https://delivery-p143040-e1559260.adobeaemcloud.com/adobe/assets/urn:aaid:aem:f60bf728-a665-4760-b099-31631a1f02bc/renditions/original/as/msecli-linux.run)
md5sums=('d254cf7bc4a5c3fb9e72505c8125d292')
sha1sums=('81949d2232213e1cbe8537d56f8eda38e04ecf7a')

package() {
	install -Dm755 "msecli-linux.run" "${pkgdir}/usr/bin/msecli"
}
