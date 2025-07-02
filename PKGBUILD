# Maintainer: Frederick Price <fprice@pricemail.ca>

pkgname=soundfont-sso-sfz
pkgver=4.0
pkgrel=1
pkgdesc="The Sonatina Symphonic Orchestra by Mattias Westlund. (SFZ format)"
arch=('any')
url="https://github.com/peastman/sso"
license=("CC-Sampling-Plus-1.0")
optdepends=("linuxsampler: for playing SFZ instruments")
groups=('soundfonts')
source=("https://github.com/peastman/sso/archive/refs/tags/v4.0.tar.gz")
md5sums=('2c87cb754b6fab6f34566123cc3e74bb')

package() {
      cd "$srcdir"
        install -m755 -d "${pkgdir}/usr/share/sounds"
        install -m755 -d "${pkgdir}/usr/share/sounds/Sonatina\ Symphonic\ Orchestra/samples"

        cp -rp sso-4.0/Sonatina\ Symphonic\ Orchestra/* "${pkgdir}/usr/share/sounds/Sonatina\ Symphonic\ Orchestra/samples"
        cp sso-4.0/README.md "${pkgdir}/usr/share/sounds/Sonatina\ Symphonic\ Orchestra"

        install -Dm644 sso-4.0/LICENSE "${pkgdir}/usr/share/licenses/Sonatina\ Symphonic\ Orchestra/LICENSE"
}
