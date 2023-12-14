# Maintainer: szdytom <szdytom@qq.com>
pkgname=nyanpasu-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="BiliBili 番剧视频和弹幕元数据的解析脚本(∠・ω< )⌒☆"
arch=('any')
url="https://github.com/szdytom/nyanpasu"
license=('GPL2')
depends=('nodejs')
provides=('nyanpasu')

source=(
	"https://github.com/szdytom/nyanpasu/releases/download/${pkgver}/nyanpasu.mjs"
	"LICENSE"
)

sha256sums=(
	'298a55dbc08c0308b435ccd24d51cd035b7f00f222bf9778744df2a26774fc54'
	'8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
)

package() {
  cd "${srcdir}"
  
  # Install the executable file
  install -Dm755 "nyanpasu.mjs" "${pkgdir}/usr/bin/nyanpasu.mjs"
  
  # Install the license file
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

