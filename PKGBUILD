# Maintainer: Ole Ernst <olebowle[at]gmx[dot]com>
pkgname=jcatgui-9kw
pkgver=1.1.6.b
pkgrel=1
pkgdesc='An application written to solve jobs or rather to earn credits on 9kw.eu in more comfortable way than in a browser.'
arch=('any')
url='https://sites.google.com/site/jcatgui9kw/'
license=('unknown')
depends=('java-runtime')
source=('https://sites.google.com/site/jcatgui9kw/jCatGUI_9kw.zip'
	'notify.wav'
        'jcatgui-9kw.desktop'
	'jcatgui-9kw.png')
md5sums=('28ffa0b7d05cf8945422f815525b65fa'
         '73bbae9aa821442121b423d32cacdc70'
         'dddc2627da8cfdcbb0bdd03729145a2b'
         'a4f5f45962d237882135aa652cbd5418')

package() {
  cd "${srcdir}"
  install -Dm644 jCatGUI_9kw.jar "${pkgdir}/usr/share/${pkgname}/jCatGUI_9kw.jar"
  install -Dm644 notify.wav "${pkgdir}/usr/share/${pkgname}/notify.wav"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
} 
