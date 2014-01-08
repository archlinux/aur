# Maintainer: carstene1ns <arch carsten-teibes de>

pkgname=eclipse-i18n-de
pkgver=4.3.0
pkgrel=2
_buildid=R0.11.1
_release=v20131123020001
_codename=kepler
pkgdesc="German language pack for eclipse IDE (and selected components)"
url="http://babel.eclipse.org/"
arch=('any')
license=('EPL')
depends=('eclipse>=4.3')
conflicts=('eclipse-i18n-pack1')
source=("http://www.eclipse.org/downloads/download.php?r=1&file=/technology/babel/babel_language_packs/$_buildid/$_codename/BabelLanguagePack-eclipse-de_$pkgver.$_release.zip"
        "http://www.eclipse.org/downloads/download.php?r=1&file=/technology/babel/babel_language_packs/$_buildid/$_codename/BabelLanguagePack-datatools-de_$pkgver.$_release.zip"
        "http://www.eclipse.org/downloads/download.php?r=1&file=/technology/babel/babel_language_packs/$_buildid/$_codename/BabelLanguagePack-technology.packaging-de_$pkgver.$_release.zip"
        "http://www.eclipse.org/downloads/download.php?r=1&file=/technology/babel/babel_language_packs/$_buildid/$_codename/BabelLanguagePack-tools.cdt-de_$pkgver.$_release.zip"
        "http://www.eclipse.org/downloads/download.php?r=1&file=/technology/babel/babel_language_packs/$_buildid/$_codename/BabelLanguagePack-webtools-de_$pkgver.$_release.zip")
sha256sums=('8726c156352fddbf2cf3fcfa58b94b51a7575789c282cd56dc2730fc539aa53f'
            '389952b94012fba2d2bce49eef510cabb2a55d963be6d984ac74a83f92784e3b'
            'b2d1452ef6bb1d49269e68a4900d2dd4ecdb9b8f040658a7b78e777af4ebc80b'
            'd007a4785b49e02ab5a526e8c1374b750fe44a22fb327e55ae8f07c0ef0e69fd'
            'ec8b92023fb2a9d93c48df4217dcebba164c27b1e878c44f337d1e6f34718311')

package() {
  install -d "$pkgdir"/usr/share
  cp -r eclipse "$pkgdir"/usr/share
}
