# Maintainer: Matthias Braun <me@matthiasbraun.eu>
pkgname=show_sway_workspace_name-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Shows the current Sway workspace name as a large overlay on each monitor"
arch=(x86_64)
url="https://gitlab.com/bullbytes/show_sway_workspace_name"
license=(AGPL-3.0-or-later)
depends=()
provides=(show_sway_workspace_name)
conflicts=(show_sway_workspace_name)
options=('!strip' '!debug')
source=(
    "show_sway_workspace_name-${pkgver}-x86_64::https://gitlab.com/api/v4/projects/84644846/packages/generic/show_sway_workspace_name/${pkgver}/show_sway_workspace_name-x86_64"
    "LICENSE::https://gitlab.com/bullbytes/show_sway_workspace_name/-/raw/v${pkgver}/LICENSE"
    "show_sway_workspace_name.1::https://gitlab.com/bullbytes/show_sway_workspace_name/-/raw/v${pkgver}/man/show_sway_workspace_name.1"
)
b2sums=('b4a6c6ecda1b97b8b5a02b78d14ebb8636cb087f6b2a59c5fa76bfec333cdf219c0d8b187cf7ab3e15d2c1256053d8c31d1a7da47bad8afc3084e65773c8bb52'
        'b6829320f725e3e45c4807ef5deb4738a691fb3ab146d8531b81fdbccd8376a826c8ec76165985cdf37d534f68e395652c96841ba7636c4bd34c49b7c7b3a9ec'
        '8088302e1f1b20870490dd9cb70c24816631e671aa97e96c6d7dee5ae13977e5adfbede2c5a831027b6610a18f26e580e1cfb0f3a40db70a1c6d4743ec8f902e')

package() {
    install -Dm755 "show_sway_workspace_name-${pkgver}-x86_64" "$pkgdir/usr/bin/show_sway_workspace_name"
    install -Dm644 LICENSE                                     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 show_sway_workspace_name.1                  "$pkgdir/usr/share/man/man1/show_sway_workspace_name.1"
}
