# Maintainer: Kent Hou Man <knthmn0 at gmail dot com>

pkgname=otf-monaspace
pkgver=1.000
pkgrel=1
pkgdesc='An innovative superfamily of fonts for code, by GitHub'
arch=(any)
url='https://github.com/githubnext/monaspace'
license=(custom:OFL)
source=("https://github.com/githubnext/monaspace/releases/download/v${pkgver}/monaspace-v${pkgver}.zip")
b2sums=('f22a24580e21edc2488dffd8dfce22551ff5ba88e199349e9d835b9ccb04dc3f6bec3b6a4c0f22e3ce8fba1e541fd3b8ddc6593dc21bb12a082833b199a1c00e')

package() {
  find monaspace-v${pkgver}/fonts/otf -type f -name '*.otf' -exec \
    install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" {} \;
  install -Dm644 monaspace-v${pkgver}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
