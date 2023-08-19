# Maintainer: Derek Taylor <derek@distrotube.com>
pkgname=multicolor-sddm-theme
pkgver=0.1.9
pkgrel=1
pkgdesc="An SDDM theme that has nine colorschemes available"
arch=('x86_64')
url="https://gitlab.com/dwt1/multicolor-sddm-theme"
license=('GPL')
groups=()
depends=('sddm>=0.14.0')
makedepends=('git')
optdepends=('otf-raleway: raleway font support'
            'ttf-impallari-raleway-family: raleway font support'
            'otf-font-awesome: Fontawesome support'
            'ttf-font-awesome: Fontawesome support'
            'ttf-google-fonts-git: Open fonts from google, included raleway')
provides=(multicolor-sddm-theme)
conflicts=()
replaces=()
backup=()
options=()
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
  cd ${pkgname}
  install -dm 755 "${pkgdir}"/usr/share/sddm/themes/${pkgname}
  cp -r --no-preserve='ownership' * "${pkgdir}"/usr/share/sddm/themes/${pkgname}
}
