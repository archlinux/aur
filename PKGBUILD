# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=otf-vegur
pkgver=0.701
pkgrel=7
pkgdesc='Humanist sans-serif font used for the LibreOffice logo'
arch=('any')
url='https://dotcolon.net/font/vegur'
license=('custom')
source=("https://dotcolon.net/download/fonts/vegur_${pkgver/./}.zip"
        'LICENSE')
sha256sums=('cfb06f0860aae4a6ed0ffaba4ab749a7c09c7f482e68a284a6f832c8382669ed'
            'a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499')

package() {
  install -d "${pkgdir}"/usr/share/fonts/OTF
  install -m644 *.otf "${pkgdir}"/usr/share/fonts/OTF
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
