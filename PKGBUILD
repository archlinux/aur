pkgname=lifeos-udf-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="LifeOS UDF ↔ DOCX Çevirici. UYAP UDF dosyalarinizi hizli sekilde word belgelerine donusturun."
arch=('x86_64')
url="https://github.com/07erkanoz/LifeOS-Udf-Cevirici"
license=('custom')
depends=('gtk3' 'sqlite' 'xdg-utils')
options=('!strip' '!emptydirs')
provides=('lifeos-udf')
conflicts=('lifeos-udf')
source=("https://github.com/07erkanoz/LifeOS-Udf-Cevirici/releases/download/v${pkgver}/lifeos-udf_${pkgver}_amd64.deb")
sha256sums=('175f6574e12ac4627f5a04609ab1e7cf6b89eddd400b91fd8fcd14391d1b245f')

package() {
    # .deb dosyasi icindeki contents ve metadata dizinlerini ac
    tar -xf data.tar.xz -C "${pkgdir}"

    # Debian 'opt', 'usr' gibi ana klasor yapilarini koruyarak ciktilari dogrudan dosya sistemine tasidik.
    # Bu paket direkt uretilmis makine kodu ve resimleri/kutuphaneleri tasiyacagi 
    # Arch Linux sisteminizin yapisina tamamen uyumludur.
}
