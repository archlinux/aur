# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>

pkgname=fonts-meta-extended-lt
pkgver=2
pkgrel=2
pkgdesc='Extended font collection meta package, ported from Infinality (lite version).'
arch=('any')
url='http://bohoomil.com/doc/05-fonts/'
license=('GPL')
# Those commented out aren't in the repos/AUR
depends=(
  'fonts-meta-base'
  'cantarell-fonts'
  'ttf-oswald'
  'ttf-quintessential'
  'tex-gyre-fonts'
# 't1-cursor-ib'
  'gsfonts'
  'ttf-caladea'
  'ttf-impallari-cantora'
  'ttf-carlito'
  'ttf-droid'
# 'ttf-gelasio-ib'
  'ttf-merriweather'
  'ttf-merriweather-sans'
  'ttf-opensans'
  'ttf-signika'
  'ttf-ubuntu-font-family'
  'xorg-fonts-misc'
)
optdepends=(
  'ttf-gelasio-ib'
)
provides=('ibfonts-meta-extended-lt' 'xorg-fonts-type1')
conflicts=('ibfonts-meta-extended-lt' 'xorg-fonts-type1')
replaces=('xorg-fonts-type1') 
source=('30-infinality-aliases.conf::https://gist.github.com/cryzed/4f64bb79e80d619866ee0b18ba2d32fc/raw/bd073b52365393f9f0718425271825fc27b218f7/local.conf')
md5sums=('bb04a521a7702c963790666f16013d1c')

package() {
  install -Dm644 -t "${pkgdir}/etc/fonts/conf.avail" 30-infinality-aliases.conf
}
