# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=otf-latin-modern
pkgver=2.006
pkgrel=1
pkgdesc='Improved version of Computer Modern fonts as used in LaTeX'
arch=(any)
url='http://www.gust.org.pl/projects/e-foundry/latin-modern'
license=(LicenseRef-GFL)
source=("$url/download/lm${pkgver}otf.zip"
        "${url%/*}/licenses/GUST-FONT-LICENSE.txt")
sha256sums=('608a6f3de9fbafd70f977fbf21ca32850178dd19b11530385358840c8f291f06'
            '5eb61bb836bb1845ef668717cb15b382e997748ce2629e4388cc5e4c3fa4e433')

package() {
    install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
    install -Dm0644 GUST-FONT-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/GFL.txt"
}
