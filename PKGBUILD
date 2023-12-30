# Maintainer: szdytom <szdytom@qq.com>
pkgname=nyanpasu-bin
pkgver=0.1.3
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
	'41334c9f710ff159cc79b0600f3f7b86cc2a11352aa3f9aea7dd96c84e70ab5c'
	'8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
)

package() {
  cd "${srcdir}"
  
  # Install the executable file
  install -Dm755 "nyanpasu.mjs" "${pkgdir}/usr/bin/nyanpasu.mjs"
  
  # Install the license file
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

