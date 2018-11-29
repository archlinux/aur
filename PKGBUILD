# Maintainer: Elrondo46 TuxnVape <elrond94@hotmail.com>
# Contributor: Wascar Adrien Jussak TuxnVape <adrien.jussak@wascardev.com> 
pkgname=lightning-i18n-fr
pkgver=6.2.3.1
pkgrel=1
pkgdesc="French translation for lightning extension"
arch=('any')
license=('GPL3')
url="https://www.thunderbird.net"
depends=('thunderbird' 'thunderbird-i18n-fr')
install=lightning.install
source=("https://tnv.wascardev.com/{e2fda1a4-762b-4020-b5ad-a41df1933103}.xpi")
sha256sums=('73dca07a2bae3e34b78445dfcfaa2b86714a494c57d95947cab8f8ca96496552')

package() {
        install -Dm644 "{e2fda1a4-762b-4020-b5ad-a41df1933103}.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/{e2fda1a4-762b-4020-b5ad-a41df1933103}.xpi"
}
