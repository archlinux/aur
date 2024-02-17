# Maintainer: Filip Parag <filip@parag.rs>

pkgname=mergetb-cli-bin
pkgver=1.1.19
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
sha1sums_x86_64=('480ae880c12554779108a1cc798365c7134c636b')
sha1sums_i686=('edfddc8411f63f06303b340248ba374d02b44930')
sha1sums_aarch64=('5dd27ea86f360c37e8d404c2d00797a430848bb8')

package()
{
    install -Dm755 "${srcdir}/mrg" "${pkgdir}/usr/bin/mrg"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/mrg/README.md"
}
