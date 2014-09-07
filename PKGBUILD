# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=eclipse-i18n-de
_version=4.4.0
_buildid=R0.12.0
_release=v20140623020002
_codename=luna
pkgver=$_version.$_release
pkgrel=1
pkgdesc="German language pack for eclipse IDE (and selected components)"
url="http://babel.eclipse.org/"
arch=('any')
license=('EPL')
depends=('eclipse>=4.4')
source=("http://www.eclipse.org/downloads/download.php?r=1&file=/technology/babel/babel_language_packs/$_buildid/$_codename/BabelLanguagePack-eclipse-de_$_version.$_release.zip"
        "http://www.eclipse.org/downloads/download.php?r=1&file=/technology/babel/babel_language_packs/$_buildid/$_codename/BabelLanguagePack-datatools-de_$_version.$_release.zip"
        "http://www.eclipse.org/downloads/download.php?r=1&file=/technology/babel/babel_language_packs/$_buildid/$_codename/BabelLanguagePack-technology.packaging-de_$_version.$_release.zip"
        "http://www.eclipse.org/downloads/download.php?r=1&file=/technology/babel/babel_language_packs/$_buildid/$_codename/BabelLanguagePack-webtools-de_$_version.$_release.zip")
sha256sums=('017212094f5b15dd19171b67f0f11acf5e1d25939a109b8bcad0f3295a8a3b5a'
            '6f9d809c7e30c8096803311ee1bf9893a19e237c29b3010e51c7bb3837f4c90f'
            '52dda810e5eded503794cb73432cf0b3414d91563b4f2e017dcb320c33758669'
            'd4b01ab402957c0d0a5b33b75e8a0b2d54b6ad12ccd511abbcf15469661ecd05')

package() {
  install -d "$pkgdir"/usr/share
  cp -r eclipse "$pkgdir"/usr/share
}
