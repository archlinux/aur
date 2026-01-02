pkgname=pd-bin
pkgver=5084b4b
pkgrel=1
pkgdesc="Perfect Dark Reimplimentation engine bin package compiled from the official repository: https://github.com/fgsfdsfgs/perfect_dark"
arch=('x86_64' 'i686' 'aarch64')
source_x86_64=("https://gitlab.com/linuxbombay/perfectdark/binaries/$pkgver/-/raw/main/pd-x86_64-linux.tar.xz")
source_i686=("https://gitlab.com/linuxbombay/perfectdark/binaries/$pkgver/-/raw/main/pd-i686-linux.tar.xz")
source_aarch64=("https://gitlab.com/linuxbombay/perfectdark/binaries/$pkgver/-/raw/main/pd-arm64-linux.tar.xz")
url="https://gitlab.com/linuxbombay/perfectdark"
license=('GPL')
depends=('sdl2' 'alsa-lib' 'alsa-plugins' 'pipewire')

sha256sums_x86_64=('268568b4619a5281ef26ebc5cc30c9c4ab9733847ad03684cd6a9ec3d359bb25')
sha256sums_i686=('6a74c125b9afe332d7ff3f179abdbb1b42d26ed738c38c1614bcc778db4cc76f')
sha256sums_aarch64=('4045c3091dc4b7593b315ef086bc21ea361d5f0a68b8bad2a9506966a7a13a77')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/pd" "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/pd.pal" "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/pd.jpn" "$pkgdir/usr/bin"
}
