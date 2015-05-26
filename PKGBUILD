# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>
# Contributor: Daniel AL Monagas - Zokeber <zokeber@archlinux.org.ve>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=eclipse-i18n-es
_pkgversion="4.4.0"
_release="R0.12.1"
_namerel="luna"
_pkgbuild="v20141223043836"
pkgver=${_pkgversion}.${_pkgbuild}
pkgrel=2
pkgdesc="(Español) Spanish language pack for eclipse IDE"
url="http://babel.eclipse.org/"
arch=("any")
license=("EPL")
depends=("eclipse")
makedepends=("unzip")
conflicts=("eclipse-i18n-es-pack")
source=("http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-eclipse-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-mylyn-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-birt-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-datatools-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-eclipse.orion-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-modeling.ecp-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-modeling.emfstore-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-modeling.graphiti-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-rt.rap-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-soa.stardust-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-technology.packaging-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-technology.recommenders-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-tools.linuxtools-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-tools.pdt-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-tools.tm-es_${_pkgversion}.${_pkgbuild}.zip"
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/babel/babel_language_packs/${_release}/${_namerel}/BabelLanguagePack-webtools-es_${_pkgversion}.${_pkgbuild}.zip")

package() {

  mkdir -p "${pkgdir}/usr/share/eclipse/plugins"
  cp -Rv "${srcdir}/eclipse" "${pkgdir}/usr/share/"

  cp -Rv "${srcdir}/lib" "${pkgdir}/usr/share/eclipse"

  cp -Rv "${srcdir}/org".* "${pkgdir}/usr/share/eclipse/plugins/"

}
# makepkg -g default to md5 so I do, blame Allan
md5sums=('fd26f3e66dfbf203df327f8b127f6197'
         'e8698e8953c1eecf2a3dc52b0b885057'
         '7a448748c3f8bd8aa0ad109992c93bf9'
         '3dccfde6ae13d5f2cf2b4e964d54c815'
         '48533290bddcb0a468ad117122431ba4'
         '36fd17fc807e4670aac243b7ff26739a'
         'a6008aaad7bec230cdaf7bf48fe45fa3'
         '0a90ebbf25b642ef8ffcdf89a65af9a6'
         'c19b760f712795599f68bfdd415f6b39'
         '09f36348efab39e57ffae873537c274a'
         '5c041521d8b86a1f18d6fc562d6ab2f8'
         '85e22154c988aa1d2e8848211397971e'
         'c17c0be9cc6fa23d65650656f9d9ceeb'
         '2881f3d1c76495a4e80c3d1b2f74a570'
         '381e9ba3d698515095a47dc07d927c63'
         'e288efe5425e70ba346b1ac0586b483e')
