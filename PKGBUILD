# Maintainer: GordonGR <gordongr@freemail.gr>
pkgname=otf-asana-math
pkgver=000.955
pkgrel=1
license=('Custom: OFL')
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="A font to typeset maths in Xe(La)TeX and Lua(La)TeX by Apostolos Syropoulos"
arch=('any')
url="http://www.ctan.org/pkg/asana-math"
source=("ftp://ftp.rrzn.uni-hannover.de/pub/mirror/tex-archive/fonts/Asana-Math/Asana-Math.otf" 
"http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=OFL_plaintext&filename=OFL.txt")
md5sums=('211fab1e4aab4e3464cc99cefc1e80ce'
         '6ed93967ff0dc6dd9c8d31c17f817a06')
install=$pkgname.install

package()
{
mkdir -p $pkgdir/usr/share/fonts/OTF
cp *.otf $pkgdir/usr/share/fonts/OTF
mkdir -p $pkgdir/usr/share/licenses/custom/otf-asana-math/
mv 'render_download.php?&format=file&media_id=OFL_plaintext&filename=OFL.txt' LICENSE
cp LICENSE $pkgdir/usr/share/licenses/custom/otf-asana-math/
}
