pkgname=lifeos-udf-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="Profesyonel UYAP UDF ↔ DOCX Çevirici. Belgelerinizi hızlı, güvenli ve kayıpsız bir şekilde dönüştürün. (Binary sürüm)"
arch=('x86_64')
url="https://github.com/07erkanoz/LifeOS-Udf-Cevirici"
license=('custom')
depends=('gtk3' 'sqlite' 'xdg-utils')
options=('!strip' '!emptydirs')
provides=('lifeos-udf')
conflicts=('lifeos-udf')
source=("https://github.com/07erkanoz/LifeOS-Udf-Cevirici/releases/download/v${pkgver}/lifeos-udf_${pkgver}_amd64.deb")
sha256sums=('3f308c923c1a37aa27f165a3e41ede30e2776ce33e0cbd3f446853ead899a082')

package() {
    # .deb dosyasi icindeki contents ve metadata dizinlerini ac
    tar -xf data.tar.xz -C "${pkgdir}"

    # Debian 'opt', 'usr' gibi ana klasor yapilarini koruyarak ciktilari dogrudan dosya sistemine tasidik.
    # Bu paket direkt uretilmis makine kodu ve resimleri/kutuphaneleri tasiyacagi 
    # Arch Linux sisteminizin yapisina tamamen uyumludur.
}
