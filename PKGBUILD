# Maintainer: Filip Parag <filip@parag.rs>

pkgname=mergetb-cli-bin
pkgver=1.2.4
pkgrel=1
pkgdesc="Command-line tool used to interact and manage a Merge testbed and experiments"
arch=('x86_64' 'i686' 'aarch64')
conflicts=()
provides=()
url="https://gitlab.com/mergetb/portal/cli/"
license=()
depends=()
source_x86_64=("mrg_${pkgver}_amd64.tar.gz::https://gitlab.com/mergetb/portal/cli/-/releases/v${pkgver}/downloads/mrg_${pkgver}_linux_amd64.tar.gz")
source_i686=("mrg_${pkgver}_i386.tar.gz::https://gitlab.com/mergetb/portal/cli/-/releases/v${pkgver}/downloads/mrg_${pkgver}_linux_386.tar.gz")
source_aarch64=("mrg_${pkgver}_arm64.tar.gz::https://gitlab.com/mergetb/portal/cli/-/releases/v${pkgver}/downloads/mrg_${pkgver}_linux_arm64.tar.gz")
sha1sums_x86_64=('264cc12629de4be45abd59865d8f6377fb9fd7ed')
sha1sums_i686=('f2767b879e22464754b0fd7d54ee3a28d20eed77')
sha1sums_aarch64=('a2277a2ca8c15152be6534d6cab392cf3fbd29e2')

package()
{
    install -Dm755 "${srcdir}/mrg" "${pkgdir}/usr/bin/mrg"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/mrg/README.md"
}
