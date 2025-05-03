# Maintainer: luxcem <a@luxcem.fr>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >

pkgname=ttf-bitter
pkgver=1.300
pkgrel=4
pkgdesc='A font specially designed for comfortably reading on any computer or device.'
url="http://www.huertatipografica.com/fonts/bitter-ht"
arch=('any')
license=('custom:OFL')
conflicts=('otf-google-fonts-hg')
source=("bitter.zip::https://www.huertatipografica.com/free_download/144"
        "OFL.txt")
sha256sums=('46fc907a6cded7dd79af145b542e129b69a0787d7366298e8ece0b710e47e7f7'
            'ce243fd4a62b1b76c959ffba6ec16a7a3146b2362d441ae4f9f7f32fc3750d6c')

package() {
  install -d "${pkgdir}/usr/share/fonts/${pkgname}"
  install -m644 "${srcdir}"/*.ttf "${pkgdir}/usr/share/fonts/${pkgname}/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"LICENCE
}
