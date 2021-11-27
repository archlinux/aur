pkgname="cobra-knife"
pkgver="0.0.1"
pkgrel="2"
pkgdesc="cobra is a swiss army knife"
arch=("x86_64")
depends=('ffmpeg')
source=("https://github.com/DHWIDSA/cobra/raw/main/cobra.tar.gz")


package() {

   install -d "${pkgdir}/usr/local/"
   install -d "${pkgdir}/usr/bin/"

   cp -r "$pkgname" "${pkgdir}/usr/local/"
   ln -s "/usr/local/$pkgname/cobra" "${pkgdir}/usr/bin/$pkgname"
}
md5sums=('c857152ec0eecf4dadd5128fb281a36c')
