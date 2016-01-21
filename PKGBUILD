# Maintainer: aksr <aksr at t-com dot me>
pkgname=otf-libertinus-git
pkgver=r216.6a04890
pkgrel=1
epoch=
pkgdesc="Libertinus font family"
arch=('any')
url="https://github.com/khaledhosny/libertinus"
license=('custom:OFL' 'GPL')
groups=()
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=otf.install
source=("$pkgname::git+https://github.com/khaledhosny/libertinus.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 libertinuskeyboard-regular.otf $pkgdir/usr/share/fonts/OTF/libertinuskeyboard-regular.otf
  install -Dm644 libertinusmath-regular.otf $pkgdir/usr/share/fonts/OTF/libertinusmath-regular.otf
  install -Dm644 libertinusmono-regular.otf $pkgdir/usr/share/fonts/OTF/libertinusmono-regular.otf
  install -Dm644 libertinussans-bold.otf $pkgdir/usr/share/fonts/OTF/libertinussans-bold.otf
  install -Dm644 libertinussans-italic.otf $pkgdir/usr/share/fonts/OTF/libertinussans-italic.otf
  install -Dm644 libertinussans-regular.otf $pkgdir/usr/share/fonts/OTF/libertinussans-regular.otf
  install -Dm644 libertinusserif-bold.otf $pkgdir/usr/share/fonts/OTF/libertinusserif-bold.otf
  install -Dm644 libertinusserif-bolditalic.otf $pkgdir/usr/share/fonts/OTF/libertinusserif-bolditalic.otf
  install -Dm644 libertinusserif-italic.otf $pkgdir/usr/share/fonts/OTF/libertinusserif-italic.otf
  install -Dm644 libertinusserif-regular.otf $pkgdir/usr/share/fonts/OTF/libertinusserif-regular.otf
  install -Dm644 libertinusserif-semibold.otf $pkgdir/usr/share/fonts/OTF/libertinusserif-semibold.otf
  install -Dm644 libertinusserif-semibolditalic.otf $pkgdir/usr/share/fonts/OTF/libertinusserif-semibolditalic.otf
  install -Dm644 libertinusserifdisplay-regular.otf $pkgdir/usr/share/fonts/OTF/libertinusserifdisplay-regular.otf
  install -Dm644 libertinusserifinitials-regular.otf $pkgdir/usr/share/fonts/OTF/libertinusserifinitials-regular.otf
  install -Dm644 OFL.txt $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE-OFL
  install -Dm644 GPL.txt $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE-GPL
  install -Dm644 LICENCE.txt $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

