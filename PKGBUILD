# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tarkan Al-Kazily <tarkucar at mac dot com>
pkgname=nintendo-labo-font
pkgver=1.0
pkgrel=1
pkgdesc="Nintendo Labo font package"
arch=(any)
source=("https://github.com/TarkanAl-Kazily/nintendo-labo-font/raw/master/nintendo-labo-font-otf.tar.gz")
sha256sums=('d5ed39678f5f8755136bcd39326c670dcf7ee9418742a826ebbd63528745650a')
url="https://www.reddit.com/r/nintendolabo/comments/eqdbs9/i_recreated_the_nintendo_labo_font_for_everyone/"
license=(custom)

package() {
    install -dm 755 "$pkgdir/usr/share/fonts/${pkgname}"
    install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 *.otf
}
