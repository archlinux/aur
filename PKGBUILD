# Maintainers: TheConfuZzledDude, swyter, M0Rf30

pkgname=jflap-beta
pkgver=8.0
pkgrel=3
pkgdesc="Software for learning the basic concepts of Formal Languages and Automata Theory, latest version with custom SVG icon and GTK theming."
arch=('any')
url="http://www.jflap.org/"
license=('CCPL')
# conflicts=('')
depends=('java-runtime')
install=jflap.install

# there's also the less complete v8.0 version: http://www.jflap.org/jflaptmp/jan24-15/JFLAP8_beta.jar
source=('http://www.jflap.org/jflaptmp/jan24-15/JFLAP8_beta.jar'
        'jflap-beta.sh' 'jflap-beta.desktop' 'swyter-jflap-icon.svg')
noextract=('JFLAP8_beta.jar, JFLAP.jar')

package()
{
  #cd $srcdir
  install -Dm 644 'JFLAP8_beta.jar'             "$pkgdir/opt/jflap-beta/JFLAP.jar"
  install -Dm 755 'jflap-beta.sh'              "$pkgdir/usr/bin/jflap-beta"
  install -Dm 755 'jflap-beta.desktop'         "$pkgdir/usr/share/applications/jflap-beta.desktop"
  install -Dm 644 'swyter-jflap-icon.svg' "$pkgdir/usr/share/icons/hicolor/scalable/apps/swyter-jflap-icon.svg"
}
md5sums=('61f817d40e813176dc09b4aa0f5d6370'
         '2fc85ec1b403128a6e806ee42ecd3f51'
         'd492591086c0d565bebaa5621777aa58'
         '6925236e7c32342045a7ad1b31984cfb')
