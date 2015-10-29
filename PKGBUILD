# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=backblaze-b2
pkgver=0.3.0
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client"
url="https://www.backblaze.com/b2/cloud-storage.html"
depends=('python')
optdepends=()
# MIT or Creative Commons: https://www.backblaze.com/using_b2_code.html
license=('MIT')
arch=('any')

# Need a better source URL at some point
source=("https://docs.backblaze.com/public/b2_src_code_bundles/b2")
sha512sums=('29384d8d271c0b595ca922819683de2ae235dfd6725ce979f8d50efb0727063df516247e681e2445de84f1f16e29e67f4c447f714cf1a4461d52da297e16dbc5')

package() {
    # Installed to backblaze-b2 because the Boost pkg installs /usr/bin/b2
    install -D ${srcdir}/b2 ${pkgdir}/usr/bin/backblaze-b2
}

