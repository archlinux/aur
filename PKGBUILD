# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>
# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>
# Contributor: Daniel AL Monagas - Zokeber <zokeber@archlinux.org.ve>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

pkgname=eclipse-i18n-es
_pkgversion="4.7.0"
_release="R0.15.0"
_namerel="oxygen"
_pkgbuild="v20170819060001"
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
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-technology.egit-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-datatools-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-technology.jgit-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-technology.packaging.mpc-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-tools.gef-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-modeling.emf-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-modeling.graphiti-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-modeling.mdt.bpmn2-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-mylyn-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-soa.bpmn2-modeler-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-technology.packaging-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-technology.recommenders-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-tools.tm-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-webtools-es_${_pkgversion}.${_pkgbuild}.zip")

package() {

  mkdir -p "${pkgdir}/usr/lib"
  cp -Rv "${srcdir}/eclipse" "${pkgdir}/usr/lib/"

}
# makepkg -g default to md5 so I do, blame Allan
md5sums=('d270e6f26f79932e7192abe336e57bfe'
         '3add8e4e861bd8153b2af90600e90afc'
         'bc921e3dcdb80bba1aba9c00cdddd00b'
         'd99974f32f574b613a33d95a0640d205'
         'b67315ceabed34d1749d46870f4e518f'
         'b073f5a11541e972e40d1647e2914731'
         '2c3b24a8c12fbb9b9893a47b26508577'
         '87090ec47ed3396891f26befeaf4a47d'
         '5dbd33c094397af2189561807d8a618d'
         '02fc6641544fba7a7be6b65318f43196'
         '5c16977db900733a0c56d8df0fc6ffb5'
         'ddfcd48189b56ee0697045b5a51a6ebc'
         'c345d43c27dd38d7d8818ee73be31187'
         '74f3d5407872f9532c89a4102fa3bfee'
         '5c32038a6d58e9419da1675362579b65')
