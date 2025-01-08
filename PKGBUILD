# Maintainer: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>

pkgname=nrfutil
pkgver=6.1.2
pkgrel=2
pkgdesc="nrfutil command line utility and the nordicsemi library"
arch=('any')
url="https://github.com/NordicSemiconductor/pc-nrfutil"
license=('BSD')
depends=('python')
makedepends=('python-pip')
options=(!emptydirs)
source=()


package() {
	install -dm0755 "$pkgdir"/usr/bin
	echo -e "#!/bin/bash\nexit0" >"$pkgdir"/usr/bin/nrfutil # STUB
	chmod a+x "$pkgdir"/usr/bin/nrfutil
}
