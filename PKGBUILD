# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Sosthène Guédon <sosthene+aur@guedon.gdn>

pkgname=superflu-riteurnz
pkgver=1.2.1
pkgrel=1
pkgdesc="Artisanal point and click game"
arch=('any')
url="https://ptilouk.net/superflu-riteurnz/index.html"
license=('GPL3')
depends=('libyaml' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'hicolor-icon-theme')
source=(https://studios.ptilouk.net/files/superfluous-returnz-demo-$pkgver-gnunux.deb)
sha256sums=('7000e2703cb5dcea05eb5837f6da618074aede058de9310aee0bd7ad7be2c77d')

package() {
  tar xvf data.tar.gz -C "${pkgdir}"
}
