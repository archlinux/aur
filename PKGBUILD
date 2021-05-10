# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=fosstriangulator
pkgver=2.0.0
pkgrel=1
pkgdesc='Tool for making triangulated illustrations out of photos'
arch=('any')
url='https://github.com/FOSStriangulator/FOSStriangulator'
license=('GPL')
depends=('hicolor-icon-theme' 'java-runtime')
source=("https://github.com/FOSStriangulator/FOSStriangulator/releases/download/v$pkgver/FOSStriangulator_jar.zip"
        'fosstriangulator.sh'
        "https://raw.githubusercontent.com/FOSStriangulator/FOSStriangulator/v$pkgver/meta/linux/org.enjoyingfoss.FOSStriangulator.desktop"
        "https://raw.githubusercontent.com/FOSStriangulator/FOSStriangulator/v$pkgver/meta/linux/org.enjoyingfoss.FOSStriangulator.metainfo.xml"
        "https://raw.githubusercontent.com/FOSStriangulator/FOSStriangulator/v$pkgver/meta/linux/org.enjoyingfoss.FOSStriangulator.svg"
        "https://raw.githubusercontent.com/FOSStriangulator/FOSStriangulator/v$pkgver/meta/linux/org.enjoyingfoss.FOSStriangulator-symbolic.svg")
sha256sums=('16f9cd628ef24a08a657ee9dc0d5c11d9db1478d30f745084f1f4c19a14b954c'
            '53b2147d7b64c6d56402da0748aa7a24921b2d56e0cdaf1bd3855700b660eea9'
            '16dd5205f9806c75cd1a434eae37c81bcf356ad756ddfd1b3c7840a5ab59dfdc'
            'a1f3f6016b0d85415cfdfc71cf271661c664655fa691268207d383577d99516d'
            '8fc4da7c418092bc8597cdfabff7340a3086993f482744647e88be5f1032a641'
            '5e537ff2d5013067c906f03f4992bcd9629de92e45d0fab28bd963c3c9125714')

package() {
  install -Dm755 fosstriangulator.sh "$pkgdir"/usr/bin/FOSStriangulator
  install -Dm644 FOSStriangulator.jar "$pkgdir"/usr/share/java/$pkgname/FOSStriangulator.jar
  install -Dm644 assets/* -t "$pkgdir"/usr/share/java/$pkgname/assets
  install -Dm644 org.enjoyingfoss.FOSStriangulator.desktop "$pkgdir"/usr/share/applications/org.enjoyingfoss.FOSStriangulator.desktop
  install -Dm644 org.enjoyingfoss.FOSStriangulator.metainfo.xml "$pkgdir"/usr/share/metainfo/org.enjoyingfoss.FOSStriangulator.metainfo.xml
  install -Dm644 org.enjoyingfoss.FOSStriangulator.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/org.enjoyingfoss.FOSStriangulator.svg
  install -Dm644 org.enjoyingfoss.FOSStriangulator-symbolic.svg "$pkgdir"/usr/share/icons/hicolor/symbolic/apps/org.enjoyingfoss.FOSStriangulator-symbolic.svg
}
