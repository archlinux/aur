# Maintainer: Gr3q <floyd0122@gmail.com>

pkgname=hoppscotch-app-bin
pkgver=23.12.6
pkgrel=1
pkgdesc="This is a simple desktop version of hoppscotch (👽 Open source API development ecosystem) which build with Tauri. See also https://hoppscotch.io"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/liudonghua123/hoppscotch-app"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_armv7h=("https://github.com/liudonghua123/hoppscotch-app/releases/download/${pkgver}/hoppscotch-app-linux-${pkgver}_armhf.deb")
source_aarch64=("https://github.com/liudonghua123/hoppscotch-app/releases/download/${pkgver}/hoppscotch-app-linux-${pkgver}_arm64.deb")
source_x86_64=("https://github.com/liudonghua123/hoppscotch-app/releases/download/${pkgver}/hoppscotch-app-linux-${pkgver}_amd64.deb")
sha512sums_armv7h=('16351e2b4597ba395b8f53fd360bd99d95575872abfe53349fd7e6044a22cae3f087848ed67fd91f66b68319d7fcbbad95c8e5908f68628d0267ee0a92019544')
sha512sums_aarch64=('6c6d529cee39725120c5f5249efe148b0ee53ee8375532c105b301877e543063c9534575ebd9192121f29bf2405a40b71bd6888381841a5e8b409d3178fa8743')
sha512sums_x86_64=('1edc8f3fe48dec4e1938891c88dad1f2fcd3335852ee6ce2ac38368f517375104f5cf4ebca7abdb9a231098abcf89486cd7d75d16468f7055086d958c8d9bb48')

package(){
	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"
	sed -i 's/Name=hoppscotch-app/Name=Hoppscotch/g' "${pkgdir}/usr/share/applications/hoppscotch-app.desktop"
}
