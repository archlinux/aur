# Maintainer: obslsessed <obslsessed@protonmail.com>
pkgname="cate-bossfight-bin"
pkgver="1.6.0"
pkgrel="1"
pkgdesc="funny jinx the cat game where you click the cat, a gamemaker remake by Skirlez of the scratch game \"cate remix remix remix remix remix remix\" about the big-footed cat named jinx"
arch=("x86_64")
url="https://github.com/Skirlez/cate-bossfight-gm"
license=("custom")
depends=("wine")
source_x86_64=("https://github.com/Skirlez/cate-bossfight-gm/releases/download/$pkgver/cate-bossfight-gm-yyc-download-me.zip" "https://raw.githubusercontent.com/Skirlez/cate-bossfight-gm/main/options/windows/icons/icon.ico")
sha512sums_x86_64=("d9c44344547f5530e874dd1fb3a8219086ca8f2ebd8ea91ceac90a2d2909b966c831caf8a170ee4ddbdf902223b91f3bf01e20ddeb2e1749aa1483c05c38f336" "ca9d271ebf3a44ce91b8a5677dbd8b4dbdccc3e970dd8239a02688f0471380af4beb23f86277bc7e91ede177997654774f17954d3fbed943d018e9dcafd60950")
package() {
  echo "test"
  install -Dt "$pkgdir/opt/cate-bossfight/" "$srcdir/cate-bossfight-gm/cate-bossfight.exe" "$srcdir/cate-bossfight-gm/data.win" "$srcdir/cate-bossfight-gm/options.ini" "$srcdir/icon.ico"
  install -Dt "$pkgdir/usr/share/applications/" "$srcdir/../cate-bossfight.desktop"
}
