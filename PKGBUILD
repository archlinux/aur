# Maintainer: Elrondo46 TuxnVape <elrond94@hotmail.com>
# Contributor: Wascar Adrien Jussak TuxnVape <adrien.jussak@wascardev.com> 
pkgname=lightning-l10n-fr
pkgver=6.2.3.2
pkgrel=1
pkgdesc="French translation for lightning extension"
arch=('any')
license=('GPL3')
url="https://www.thunderbird.net"
depends=('thunderbird' 'thunderbird-i18n-fr')
install=lightning.install
source=("https://tnv.wascardev.com/{e2fda1a4-762b-4020-b5ad-a41df1933103}.xpi")
sha256sums=('b123dfdd34b6221a45750d1c4ecb4c883c0a76c26e0ad556eab089a6c7190b94')

package() {
        install -Dm644 "{e2fda1a4-762b-4020-b5ad-a41df1933103}.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/{e2fda1a4-762b-4020-b5ad-a41df1933103}.xpi"
}
