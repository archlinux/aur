# Maintainer: obslsessed <obslsessed@protonmail.com>
pkgname="cate-bossfight-bin"
pkgver="1.6.0"
pkgrel="2"
pkgdesc="funny jinx the cat game where you click the cat, a gamemaker remake by Skirlez of the scratch game \"cate remix remix remix remix remix remix\" about the big-footed cat named jinx"
arch=("x86_64")
url="https://github.com/Skirlez/cate-bossfight-gm"
license=("custom")
replaces=("cate-gms2-bin")
depends=("wine")
source_x86_64=("https://github.com/Skirlez/cate-bossfight-gm/releases/download/$pkgver/cate-bossfight-gm-yyc-download-me-please.zip" "https://raw.githubusercontent.com/Skirlez/cate-bossfight-gm/main/options/windows/icons/icon.ico")
sha512sums_x86_64=("4f561903e357c63e6803204eb071e34ffd6a8695243a7f42f94e81e674474fbb4a71a5f375bd2b20a088037d0b79e13e2816172dc09749f64ffb56d86119d2b3" "ca9d271ebf3a44ce91b8a5677dbd8b4dbdccc3e970dd8239a02688f0471380af4beb23f86277bc7e91ede177997654774f17954d3fbed943d018e9dcafd60950")
package() {
  install -Dt "$pkgdir/opt/cate-bossfight/" "$srcdir/cate-bossfight/cate-bossfight.exe" "$srcdir/cate-bossfight/data.win" "$srcdir/cate-bossfight/options.ini" "$srcdir/icon.ico"
  install -Dt "$pkgdir/usr/share/applications/" "$srcdir/../cate-bossfight.desktop"
}
