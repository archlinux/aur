# Maintainer: Bruno Jacquet <maxijac@free.fr>

pkgname=seafile-client-bin
pkgver=5.0.5
pkgrel=1
pkgdesc="Cloud storage client applet and cli from deb package"
arch=('i386' 'x86_64')
url="http://www.seafile.com"
license=('GPL3')
# Minimum requirements extracted from debian package
depends=('glibc>=2.7' 'curl>=7.16.2' 'qt4>=4.8.0' 'glib2>=2.31.8'
         'libevent>=2.0.10' 'jansson>=2.1' 'sqlite>=3.5.9'
				 'openssl>=1.0.0' 'libutil-linux>=2.16' 'zlib>=1.1.4')
conflicts=('seafile-shared' 'seafile-client' 'libsearpc' 'ccnet'
           'seafile-client-cli')

#X86_64
source_x86_64=("https://bintray.com/artifact/download/seafile-org/seafile/seafile_${pkgver}_amd64.deb")
md5sums_x86_64=('feb48fca36c801585d11d3934bd37f8d')

#i386
source_i386=("https://bintray.com/artifact/download/seafile-org/seafile/seafile_${pkgver}_i386.deb")
md5sums_i386=('1fd7314a43686771eda2de0a4e53b0aa')

prepare() {
	tar xf data.tar.gz
}

package() {
	cp -R usr "$pkgdir/"
}
