# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>
# Contributor: Daniel AL Monagas - Zokeber <zokeber@archlinux.org.ve>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=eclipse-i18n-es
_pkgversion="4.5.0"
_release="R0.13.1"
_namerel="mars"
_pkgbuild="v20151128060001"
pkgver=${_pkgversion}.${_release}.${_pkgbuild}
pkgrel=1
pkgdesc="(Español) Spanish language pack for eclipse IDE"
url="http://babel.eclipse.org/"
arch=("any")
license=("EPL")
depends=("eclipse")
makedepends=("unzip")
conflicts=("eclipse-i18n-es-pack")
source=("http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-eclipse-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-birt-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-datatools-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-eclipse.orion-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-modeling.emf-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-mylyn-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-rt.rap-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-soa.bpmn2-modeler-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-technology.packaging-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-technology.recommenders-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-tools.cdt-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-tools.pdt-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-tools.tm-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-tools.tracecompass-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-webtools-es_${_pkgversion}.${_pkgbuild}.zip")

package() {

  mkdir -p "${pkgdir}/usr/share/eclipse/plugins"
  cp -Rv "${srcdir}/eclipse" "${pkgdir}/usr/share/"

  cp -Rv "${srcdir}/lib" "${pkgdir}/usr/share/eclipse"

  cp -Rv "${srcdir}/org".* "${pkgdir}/usr/share/eclipse/plugins/"

}
# makepkg -g default to md5 so I do, blame Allan
md5sums=('5ee4fe03a796a5922e5dcc3c981a0029'
         '76aa8f0d6695289b5b7d607802d01be0'
         'ada8e0e9654fc38239198f2c22c059a4'
         'f10c46a9ddec9fce9ed3b3c2fe68c255'
         '7a9a41437fa57faa61f246589ca44462'
         '0ca913ec467d70ebceda4757fe193a67'
         'fdc51005c03d1964ffcedbb342ba70f0'
         '0991a8df56e0f74b3e564422bc18dee1'
         '571ebd81542773cd606ac791613e13e6'
         'bc873be30d1a5db9c14fdffbd565b3d0'
         '23f3c9c5a38aef247a004f4b624515fc'
         '27be91d592793840f69f1cadeeb656b4'
         '8e02624f50f3863779418918f27bf44c'
         'e7b2edb3e3f0622a53c7c14ae42f6d4b'
         'a8295691442b207b00309de46dc5e33b')
