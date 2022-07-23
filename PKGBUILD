# Maintainer: obslsessed <obslsessed@protonmail.com>
pkgname="cate-bossfight-bin"
pkgver="1.7.0"
pkgrel="2"
pkgdesc="funny jinx the cat game where you click the cat, a gamemaker remake by Skirlez of the scratch game \"cate remix remix remix remix remix remix\" about the big-footed cat named jinx"
arch=("x86_64")
url="https://github.com/Skirlez/cate-bossfight-gm"
license=("custom")
replaces=("cate-gms2-bin")
depends=("wine")
source_x86_64=("https://github.com/Skirlez/cate-bossfight-gm/releases/download/$pkgver/WINDOWS-cate-bossfight-gm-yyc-download-me-please.zip" "https://raw.githubusercontent.com/Skirlez/cate-bossfight-gm/main/options/windows/icons/icon.ico")
sha512sums_x86_64=("afdbf21cf392936e08e2ba1085a6a590a7fbbfb971e63f09d99ee840af9ab3b2558ea68ae1eff80a8245d2d916ad494c8d871920bbeb9dd8e4e59e24d1a16580" "ca9d271ebf3a44ce91b8a5677dbd8b4dbdccc3e970dd8239a02688f0471380af4beb23f86277bc7e91ede177997654774f17954d3fbed943d018e9dcafd60950")
package() {
  install -Dt "$pkgdir/opt/cate-bossfight/" "$srcdir/cate-bossfight/cate-bossfight-gm.exe" "$srcdir/cate-bossfight/data.win" "$srcdir/cate-bossfight/options.ini" "$srcdir/icon.ico"
  install -Dt "$pkgdir/usr/share/applications/" "$srcdir/../cate-bossfight.desktop"
}
