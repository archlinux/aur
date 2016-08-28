# Maintainer: NicoHood <aur {at} nicohood {dot} de>

pkgname=ipod-shuffle-4g
pkgver=1.4
pkgrel=1
pkgdesc="Python script for building the track and playlist database for the newer gen IPod Shuffle"
arch=('any')
url="https://github.com/nims11/${_pkgname}"
license=('GPL2')
depends=('python2' 'mutagen')
optdepends=('espeak: Voiceover support')
source=("https://github.com/nims11/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('949c79e82f00119c7233a5d5a21f2f513dad370d1e94d5f1d97a18ff5f42c61d3088369bb385aeb616620a852628f2f1dd1ec1ead2bab72df863defc42fa9a83')

package() {
  cd "IPod-Shuffle-4g-${pkgver}"

  # Install main script
  install -Dm755 "ipod-shuffle-4g.py" "${pkgdir}/usr/bin/ipod-shuffle-4g"

  # Add documentation
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" docs/*.md *.md
}
