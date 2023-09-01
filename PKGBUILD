# Maintainer: Mark <nextgamer3152@gmail.com>

pkgname=catbox-bash
pkgver=2.0
pkgrel=2
pkgdesc="Implementation of the catbox.moe API in bash"
arch=(any)
url="https://gist.github.com/MineBartekSA/1d42d6973ddafb82793fd49b4fb06591"
license=('MIT')
depends=('bash' 'curl')
optdepends=('xclip: for copying the upload url automatically')
source=("catbox-${pkgver}::https://gist.githubusercontent.com/MineBartekSA/1d42d6973ddafb82793fd49b4fb06591/raw/66073b9dc40a7c9e65ba470615071cf8f9f37809/catbox"
        "LICENSE")
sha256sums=('4b4547834190d56646d9dbee850261ba0f7ae3ae23aad69cdb78b3fc42c0fd9e'
            '2d9b9e6ae69adccbaf6b8e4b8d8195091abc174b4eb6ec523c952ca0166532fc')

package() {
  install -Dm755 catbox-${pkgver} "$pkgdir/usr/bin/catbox"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
