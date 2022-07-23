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
sha512sums_x86_64=("840b17299c982af3dd716aecfc2e638a4231023d75e5af7a63c0eccd59a2c1ced6290165bcb80d7081476d3c4ecf1d54ccf5a72e8c5955d5b229e57aab1e568f" "ca9d271ebf3a44ce91b8a5677dbd8b4dbdccc3e970dd8239a02688f0471380af4beb23f86277bc7e91ede177997654774f17954d3fbed943d018e9dcafd60950")
package() {
  install -Dt "$pkgdir/opt/cate-bossfight/" "$srcdir/cate-bossfight-gm.exe" "$srcdir/data.win" "$srcdir/options.ini" "$srcdir/icon.ico"
  install -Dt "$pkgdir/usr/share/applications/" "$srcdir/../cate-bossfight.desktop"
}
