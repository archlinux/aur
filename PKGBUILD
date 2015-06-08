pkgname=eclipse-jadclipse
pkgver=3.3.0
pkgrel=3
pkgdesc='JadClipse is a plug-in that seamlessly integrates Jad (the fast Java decompiler) with Eclipse.'
arch=('any')
url='http://jadclipse.sourceforge.net/'
license=('CPL')
depends=('eclipse' 'jad')
optdepends=()
source=(http://prdownloads.sourceforge.net/jadclipse/net.sf.jadclipse_${pkgver}.jar)
md5sums=('7228a814ad218aa16808ece80407d364')

package() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
  mkdir -p "$_dest/plugins"
  install -Dm644 "$srcdir/net.sf.jadclipse_$pkgver.jar" "$_dest/plugins/"
}
