# Maintainer Mihir Lad <contact at mihirlad dot com>
pkgname=dracut-luks-tpm2
pkgver=1.0.3
pkgrel=1
pkgdesc="Dracut module to retrieve LUKS key from TPM"
arch=('any')
url='https://github.com/mihirlad55/dracut-luks-tpm2'
license=('GPL3')
depends=('tpm2-tools' 'dracut')

optdepends=()
makedepends=()

source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
md5sums=('SKIP')

package() {
    cd $pkgname
    BASE_INSTALL_PREFIX="$pkgdir/" ./install.sh
}
