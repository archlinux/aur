# Maintainer: flan_suse <windows2linux_AT_zoho_DOT_com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=czkawka-cli-bin
pkgver=6.1.0
pkgrel=2
pkgdesc='Find and manage duplicate files, empty folders, similar images, and other "lint" (CLI)'
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('MIT')
provides=('czkawka-cli')
conflicts=('czkawka-cli')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_czkawka_cli"
        "LICENSE::https://github.com/qarmin/czkawka/raw/master/czkawka_cli/LICENSE")
sha256sums=('0b29ae52f7072e76f083715e145a78500e738860597496a09ae334cc6ddde567'
            'a998a6643ddefa0514738c641d9a6e5b3e3ddfd06c5381b8da836545d4b9156b')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
