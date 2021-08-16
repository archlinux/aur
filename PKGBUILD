# Maintainer: Willi Carlsen <carlsenwilli@gmain.com>

pkgname=sync-ssh-keys-bin
_pkgname=sync-ssh-keys
pkgver=0.5.0
pkgrel=1
pkgdesc="Sync public ssh keys to ~/.ssh/authorized_keys, based on Github/Gitlab organization membership."
arch=("x86_64")
url="https://github.com/samber/sync-ssh-keys"
license=("MIT")
depends=()
provides=("sync-ssh-keys")
source=("https://github.com/samber/sync-ssh-keys/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux-amd64")
sha256sums=("e1017e362d742153bc4d1e5e8fe5b7448e9d4e45b2f35cf5abd97dee571314d2")

package() {
    install -Dm755 ${srcdir}/sync-ssh-keys_${pkgver}_linux-amd64 ${pkgdir}/usr/bin/sync-ssh-keys
}

