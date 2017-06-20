# Maintainer: Stephen Bell <theredbaron1834 {at} yahoo {dot} com>
pkgname=bijint-tokei
pkgver=1.0
pkgrel=1
pkgdesc="A wallpaper changer that scrapes www.bijint.com to set your wallpaper to someone holding up the current time with many different actor sets"
arch=(i686 x86_64)
url="https://github.com/theredbaron1834/Scripts/blob/master/tokei"
license=('BSD 3 Clause')
depends=('curl')
optdepends=('libnotify')
source=("git+https://github.com/theredbaron1834/Scripts.git")
sha256sums=('SKIP')


package() {
  install -Dm 0755 "${srcdir}/Scripts/tokei" "${pkgdir}/usr/bin/bijint-tokei"
}
