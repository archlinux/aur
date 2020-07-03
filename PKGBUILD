# Maintainer: Sean Bartell <yotann@yotann.org>
# Maintainer: Holger Rauch

pkgname=ttf-dpcustommono2
pkgver=2.01
pkgrel=3
pkgdesc="PGDP font with exaggerated clarity to aid proofreading"
arch=(any)
depends=(fontconfig)
url="http://www.pgdp.net/wiki/DPCustomMono2"
source=(LICENCE https://www.pgdp.net/c/faq/DPCustomMono2.ttf)
install=$pkgname.install
license=('custom')
md5sums=('f5df9c45b5f3b8c8b6d959270b90b3ba'
         '59cc971a9f549d470de0fecc707f3e9c')
sha256sums=('38dcea7efe04c7c17ed2e0ab013e3eff7e7340fe7cb1e31491359e0b509373c3'
            'fa065d94451666170037322de2a1a66a2a493961d8021e23cb5bdb0f909041f0')

package() {
    install -D -m644 "$srcdir/DPCustomMono2.ttf" "$pkgdir/usr/share/fonts/TTF/DPCustomMono2.ttf"
    install -D -m644 "$srcdir/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
