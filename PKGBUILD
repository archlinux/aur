# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>

pkgname=nsis-inetload-bin
pkgver=200801091822
pkgrel=1
pkgdesc="MS WinInet API based plug-in for http and ftp downloads with better proxy support"
arch=('any') # Does not contain any code that's executed on the host system
url="https://nsis.sourceforge.io/InetLoad_plug-in"
license=('custom')
source=("InetLoad-$pkgver.zip::https://nsis.sourceforge.io/mediawiki/images/b/b4/InetLoad.zip"
		'LICENSE')
sha256sums=('c749b6651936f7d48dba964aa37d8a4ad58dd7960240a0030a819a752eb4e6db'
            '640cbe6013506905233100b357c24bdcdd08bbe277fd7cf7a5c892effe18208e')

package() {
  install -D "$srcdir"/InetLoad.dll "$pkgdir"/usr/share/nsis/Plugins/x86-ansi/InetLoad.dll
  install -D "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/nsis-inetload-bin/LICENSE
}
