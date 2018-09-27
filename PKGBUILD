# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>

pkgname=bbk-cli-bin
pkgver=1.0
pkgrel=1
pkgdesc="Measurement client for Bredbandskollen"
arch=('x86_64' 'armv7h' 'armv8h')
url='https://www.bredbandskollen.se/en/bredbandskollen-cli'
license=('custom: Copyright (c) 2018 Stiftelsen för Internetinfrastruktur <iis.se>')
source_x86_64=("https://frontend.bredbandskollen.se/download/bbk_cli_linux_amd64-1.0")
source_armv7h=("https://frontend.bredbandskollen.se/download/bbk_cli_linux_armhf-1.0")
source_armv8h=("https://frontend.bredbandskollen.se/download/bbk_cli_linux_armhf-1.0")
source=("https://frontend.bredbandskollen.se/download/README.txt")
sha256sums=('525254138b2dd44c810d5d31b1846dd2395eb6353c5f32805079da60a2f36ada')
sha256sums_x86_64=('7768794f5ce2c2605aa34f38010812548e02703444e90f6912387f2f13a1127e')
sha256sums_armv7h=('e68c64273bbf15514e4f9015838432d393df7480b94a3c441b191f8dc8710aca')
sha256sums_armv8h=('e68c64273bbf15514e4f9015838432d393df7480b94a3c441b191f8dc8710aca')

package() {

 install -Dm755 "$srcdir"/bbk_cli* "$pkgdir/usr/bin/bbk_cli"

 install -Dm644 "$srcdir/README.txt" "$pkgdir/usr/share/doc/$pkgname/README"

 echo "Copyright (c) 2018 Stiftelsen för Internetinfrastruktur <iis.se>" > "$srcdir/copyright"
 install -Dm644 "$srcdir/copyright" "$pkgdir/usr/share/licenses/$pkgname/copyright"

}
