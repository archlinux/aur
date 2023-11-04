# Maintainer: MisconceivedSec (@misconceivedsec)
pkgname=mergetb-cli-bin
pkgver=1.1.11
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
sha1sums_x86_64=('ea90078b257f4e9a7dde921f990d7373a8101b64')
sha1sums_i686=('f5cc425ee7b812ed1402590de7c60f8311992a6c')
sha1sums_aarch64=('d84c80d415d1b8d32b6eb2f76b643179e1f28a39')

package()
{
    install -Dm755 "${srcdir}/mrg" "${pkgdir}/usr/bin/mrg"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/mrg/README.md"
}
