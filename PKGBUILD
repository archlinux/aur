#Maintainer: Michael Mitchell <mmitc@protonmail.com>
pkgname=file-encryptor
pkgver=1.1.33
pkgrel=1
pkgdesc="User-freindly file-encryption tool"
arch=('any')
url="https://github.com/AWildBeard/FileEncryptor"
license=('Apache License 2.0')
depends=('jre8-openjdk' 'java-openjfx')

source=("https://github.com/AWildBeard/FileEncryptor/releases/download/v1.1.33/file-encryptor.tar")

md5sums=('3c7128118badca26a5b5b0188193ca6a')

package() {
		mkdir -p "${pkgdir}/usr/share/fileencryptor"
		install -Dm644 "${srcdir}/${pkgname}/fileEncryptor.jar" "${pkgdir}/usr/share/fileencryptor/fileEncryptor.jar"
		mkdir -p "${pkgdir}/usr/share/applications/"
		install -Dm644 "${srcdir}/${pkgname}/com.github.awildbeard.fileencryptor.desktop" "${pkgdir}/usr/share/applications/"
		mkdir -p "${pkgdir}/usr/share/appdata"
		install -Dm644 "${srcdir}/${pkgname}/com.github.awildbeard.fileencryptor.appdata.xml" "${pkgdir}/usr/share/appdata"
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/{128x182,32x32,48x48,64x64}/"
		install -Dm755 "${srcdir}/${pkgname}/file-encryptor.128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/file-encryptor.png"
		install -Dm755 "${srcdir}/${pkgname}/file-encryptor.32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/file-encryptor.png"
		install -Dm755 "${srcdir}/${pkgname}/file-encryptor.48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/file-encryptor.png"
		install -Dm755 "${srcdir}/${pkgname}/file-encryptor.64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/file-encryptor.png"

}


