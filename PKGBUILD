# Maintainer: Matthias Braun <me@matthiasbraun.eu>
pkgname=show_sway_workspace_name-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Shows the current Sway workspace name as a large overlay on each monitor"
arch=(x86_64)
url="https://gitlab.com/bullbytes/show_sway_workspace_name"
license=(AGPL-3.0-or-later)
depends=(cairo pango)
provides=(show_sway_workspace_name)
conflicts=(show_sway_workspace_name)
options=('!strip' '!debug')
source=(
    "show_sway_workspace_name-${pkgver}-x86_64::https://gitlab.com/api/v4/projects/84644846/packages/generic/show_sway_workspace_name/${pkgver}/show_sway_workspace_name-x86_64"
    "LICENSE::https://gitlab.com/bullbytes/show_sway_workspace_name/-/raw/v${pkgver}/LICENSE"
)
b2sums=('4ff5783c9e7504c7fd5f788fee241c1960732955ccb26575cc0d9ad9b62bea8cd04f66c5aa2aba2741ed379365f8deb8d98b259507ee3545f2e0c76239f3566d'
        'b6829320f725e3e45c4807ef5deb4738a691fb3ab146d8531b81fdbccd8376a826c8ec76165985cdf37d534f68e395652c96841ba7636c4bd34c49b7c7b3a9ec')

package() {
    install -Dm755 "show_sway_workspace_name-${pkgver}-x86_64" "$pkgdir/usr/bin/show_sway_workspace_name"
    install -Dm644 LICENSE                                     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
