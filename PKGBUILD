# Maintainer: THEGUSPROJECT <gus@thegusproject.xyz>

pkgname=tunesviewer
pkgver=1.5.3
pkgrel=1
pkgdesc="TunesViewer is a small, easy to use program to access iTunes-university media and podcasts in Linux."
arch=('x86_64' 'i686')
url="http://sourceforge.net/projects/tunesviewer/"
options=('!strip')
sha1sums=SKIP

source=("https://dl.dropboxusercontent.com/u/29821993/tunesviewer_1.5.3.tar.gz")

depends=("python2>=2.6" "pygtk>=2.16" "python2-lxml>=2.0" "python2-notify" "python2-support>=0.90" "pywebkitgtk>=1.1.4" ")
optdepends=("soundconverter>=1.0" "vlc>=1.0")

package() {
  mkdir -p $pkgdir/usr
  cd $srcdir
  cp -r usr $pkgdir
  chmod -R 755 $pkgdir/usr/bin/tunesviewer
  chmod -R 755 $pkgdir/usr/share/applications/TunesViewer.desktop
  chmod -R 755 $pkgdir/usr/share/tunesviewer
}