# Maintainer: Linus <jh@orbt.sh>
pkgname=orbt-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="Universal terminal workspace — sessions, panes, and AI agents"
arch=('x86_64')
url="https://github.com/linuszz/orbt"
license=('AGPL-3.0-only')
provides=('orbt')
conflicts=('orbt')
source_x86_64=("orbt-linux-x86_64-${pkgver}.tar.gz::https://github.com/linuszz/orbt/releases/download/v${pkgver}/orbt-linux-x86_64.tar.gz")
sha256sums_x86_64=('SKIP')

package() {
    install -Dm755 "${srcdir}/orbt" "${pkgdir}/usr/bin/orbt"
}
