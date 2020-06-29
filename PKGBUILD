# Maintainer: GordonGR <gordongr@freemail.gr>
pkgname=otf-asana-math
pkgver=000.958
pkgrel=3
license=('Custom: OFL')
depends=()
pkgdesc="A font to typeset maths in Xe(La)TeX and Lua(La)TeX by Apostolos Syropoulos"
arch=('any')
url="http://www.ctan.org/pkg/asana-math"
source=("http://mirrors.ctan.org/fonts/Asana-Math.zip" 
	"http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=OFL_plaintext&filename=OFL.txt")
md5sums=('6de861f535bae901c8ec6f6dd57195a2'
         '6ed93967ff0dc6dd9c8d31c17f817a06')

package()
{

mkdir -p $pkgdir/usr/share/fonts/$pkgname
cp Asana-Math/Asana-Math.otf $pkgdir/usr/share/fonts/$pkgname
mv 'render_download.php?&format=file&media_id=OFL_plaintext&filename=OFL.txt' LICENSE
mkdir -p $pkgdir/usr/share/licenses/custom/otf-asana-math/
cp LICENSE $pkgdir/usr/share/licenses/custom/otf-asana-math/
}
