# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>
# Contributor: Daniel AL Monagas - Zokeber <zokeber@archlinux.org.ve>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=eclipse-i18n-es
_pkgversion="4.5.0"
_release="R0.13.0"
_namerel="mars"
_pkgbuild="v20150804081228"
pkgver=${_pkgversion}.${_pkgbuild}
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
md5sums=('37c05158b202ac0c7f2cfee6ae66236b'
         '242ed85e022b0d9180ec99ca621449d3'
         '7751bf2afbb6e3d77baae89eee7371af'
         'bb3e071a910a789acc22e7ab3def6ef3'
         'b6f3893b6244ef4900e0309fbfeaa5e0'
         'f7d680926f61978db34ea833476551c9'
         '159f26934c3e4c820d9da46902d97d35'
         '07096acf3c8eb5f53b3a8ea8ac284867'
         '3f37cc936fd2818fcc2246eb94029264'
         'f301ddd8f5580f3e5298d82884b326db'
         'aa6f2c18aeec20779cefcb2086e412da'
         '8081cd425d6c3c4857bfec0d95070219'
         '7a6a532ab54afce7d017d5893b5e416b'
         'f1d66d6e7daf3f6f15cc8cf4615deb0f'
         '7c047fde40e2db6e2ad34c77c706d87e')
