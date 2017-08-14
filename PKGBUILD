#Maintainer: Michael Mitchell <mmitc@protonmail.com>
pkgname=wild-chat
pkgver=1.1.32
pkgrel=1
pkgdesc="Customizable twitch chat client"
arch=('any')
url="https://github.com/AWildBeard/WildChat"
license=('Apache License 2.0')
depends=('jre8-openjdk' 'java-openjfx')

source=("https://github.com/AWildBeard/WildChat/releases/download/v1.1.32/wild-chat.tar")

md5sums=('5c4f2a2062fd787920198723299609e0')

package() {
		mkdir -p "${pkgdir}/usr/share/wildchat"
		install -Dm644 "${srcdir}/WildChat.jar" "${pkgdir}/usr/share/wildchat/WildChat.jar"
		mkdir -p "${pkgdir}/usr/share/applications/"
		install -Dm644 "${srcdir}/com.github.awildbeard.wildchat.desktop" "${pkgdir}/usr/share/applications/"
		mkdir -p "${pkgdir}/usr/share/appdata"
		install -Dm644 "${srcdir}/com.github.awildbeard.wildchat.appdata.xml" "${pkgdir}/usr/share/appdata"
		mkdir -p "${pkgdir}/usr/bin"
		install -Dm755 "${srcdir}/wild-chat.sh" "${pkgdir}/usr/bin/wild-chat.sh"
}


