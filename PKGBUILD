# $Id: PKGBUILD 229096 2015-01-15 20:56:23Z daniel $
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

pkgname=mono-pcl
pkgver=2014.04.14
pkgrel=1
pkgdesc="Microsoft Portable Reference Libraries"
arch=(any)
license=('unknown')
url="http://www.microsoft.com/en-us/download/details.aspx?id=40727"
depends=('mono')
source=(http://storage.bos.xamarin.com/bot-provisioning/PortableReferenceAssemblies-2014-04-14.zip)
md5sums=('cc7fa05da3e813c24708c4523482e1af')

build() {
  echo This space intentionally left blank > /dev/null
}

package() {
  mkdir -p "$pkgdir/usr/lib/mono/xbuild-frameworks/.NETPortable/"

  cp -r "$srcdir/PortableReferenceAssemblies-2014-04-14/v4.0" "$pkgdir/usr/lib/mono/xbuild-frameworks/.NETPortable/"
  cp -r "$srcdir/PortableReferenceAssemblies-2014-04-14/v4.5" "$pkgdir/usr/lib/mono/xbuild-frameworks/.NETPortable/"
  cp -r "$srcdir/PortableReferenceAssemblies-2014-04-14/v4.6" "$pkgdir/usr/lib/mono/xbuild-frameworks/.NETPortable/"
  find "$pkgdir" -type f -exec chmod 755 \{\} \;
}
