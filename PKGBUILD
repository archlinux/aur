# Maintainer: Nomz <nomzisnice@yahoo.com>
# Contributor: Twann <twann@ctemplar.com>

pkgname=tlauncher-org
pkgver=2.841
pkgrel=2
pkgdesc="Latest TL from tlauncher.org"
url="https://tlauncher.org"
arch=("any")
license=("custom")
depends=("java11-openjfx" "jdk11-openjdk" "jre11-openjdk" "jre11-openjdk-headless")
conflicts=("tlauncher-bin")
replaces=("tlauncher-bin")
source=(
"${pkgname}-${pkgver}.zip::https://dl2.tlauncher.org/f.php?f=files%2FTLauncher-${pkgver}.zip"
"tlauncher.desktop"
"https://launcher.mojang.com/download/minecraft-launcher.svg"
)
sha512sums=(
"89b5057f8137c65da1a9d78df59996e46205c8abd31d188ae8bfaaa6e447a046e65209347a59f580d5337b9e8c430723832abfc897325c18dc018bc4e58b3459"
"b6f45e7ffa7e2c0313a743af07c22be2992c9933153749d08c9c5cabccf921586744023e788acef3499daf31ac6bd441c2a68982f0790fa5f749cc429cbe6033"
"aa08e8fa2a5c1c3e2d714644cb9648adb779c09fff5a9e5b79cea42c53be3f53631d199f72c1eec56e4b4f8e46be8f4ae88fbe456865621b589a7c4f9438549a"
)

package()
{
        cd "$srcdir"
	install -Dm644 "$srcdir/TLauncher-$pkgver.jar" "$pkgdir/opt/tlauncher/tlauncher.jar"
	install -Dm644 "$srcdir/tlauncher.desktop" "$pkgdir/usr/share/applications/tlauncher.desktop"
	install -Dm644 "$srcdir/minecraft-launcher.svg"    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/tlauncher.svg"
}
