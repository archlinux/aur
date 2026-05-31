# Maintainer: GOREMAKESSTUFF <gore1@is.notaskid.ong>
pkgname=prismcli-themes
pkgver=1.0
pkgrel=1
pkgdesc="Standalone automated theme injection layer for the prismcli interface environment"
arch=('any')
url="https://aur.archlinux.org/packages/prismcli"
license=('MIT')
depends=('prismcli')
source=('prismcli-themes.py')
sha256sums=('76371f16129c9dee4194ebd30e3825df2e95c69f4d9d9f344b66cb10812d4be3')

package() {
    install -d "${pkgdir}/usr/bin"
    install -m 755 prism-theme "${pkgdir}/usr/bin/prism-theme"
}
