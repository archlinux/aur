# Contributor: Barfin
# Maintainer: Vyacheslav Razykov <v.razykov@gmail.com>

pkgname=outline-client-appimage
pkgver=1.8.1
pkgrel=1
pkgdesc="The Outline clients use the popular Shadowsocks protocol, and lean on the Cordova and Electron frameworks."
arch=(x86_64)
conflicts=('outline-client-appimage-wayland')
url="https://getoutline.org"
license=("Apache License 2.0")
source=("Outline-Client.AppImage::https://s3.amazonaws.com/outline-releases/client/linux/${pkgver}/4/Outline-Client.AppImage"
        "outline-client16.png"
        "outline-client24.png"
        "outline-client32.png"
        "outline-client48.png"
        "outline-client64.png"
        "outline-client128.png"
        "outline-client256.png"
        "outline-client512.png"
        "outline-client1024.png"
        "outline-client.desktop")
options=('!strip')

package() {
  install -Dm755 "${srcdir}/Outline-Client.AppImage" "${pkgdir}/opt/outline-client/Outline-Client.AppImage"
  install -Dm644 "${srcdir}/outline-client.desktop" "${pkgdir}/usr/share/applications/outline-client.desktop"
  install -Dm644 "${srcdir}/outline-client16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/outline-client.png"
  install -Dm644 "${srcdir}/outline-client24.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/outline-client.png"
  install -Dm644 "${srcdir}/outline-client32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/outline-client.png"
  install -Dm644 "${srcdir}/outline-client48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/outline-client.png"
  install -Dm644 "${srcdir}/outline-client64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/outline-client.png"
  install -Dm644 "${srcdir}/outline-client128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/outline-client.png"
  install -Dm644 "${srcdir}/outline-client256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/outline-client.png"
  install -Dm644 "${srcdir}/outline-client512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/outline-client.png"
  install -Dm644 "${srcdir}/outline-client1024.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/outline-client.png"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/outline-client/Outline-Client.AppImage" "${pkgdir}/usr/bin/outline-client"
}

sha512sums=('ca5f2048ae98f0463cfafc0533978791bec65a5075252bf8ed21b4d0c1fc81a986574724f096252c696a2a8c5b25cccf157d7047e4daeb984a1264dc657dbd23'
            '3a905a2ffa273b8e1277066def642428eff18e5be665974be5ae0fe9f0d0d49b52adb56f2e11f759d4c5a4ddcb7a82696f98785310c343768f2e2a8f037b8ee2'
            'c92891567c318d4b5f22b93b97536ff38346a392ef1ddb4da6fe80ec31c6e2c05095b5c0b162f328bbf8f22e505529f04bae6f1afbd3891b41e3f8a14079aafa'
            '9bebe0c6820aa4df14c4f6f9da885e7a2d940ec3b741d857e3045344e10cd9a4d20d8390a254ce3bf0188b92b331a8d3a930b35d0973f079b35eaeadcf8b0dc0'
            'e4a65178fdafde9763a50158d7e891f47ff8b7427dab9559eef82e80eaa1f35562e83869d28c2eec9d700e2613c228d8b84faf725e344904cf085c7429376d5b'
            '0d02064b5a216ea03869cf1dfe8744eb69cdc53921efb95a9ebe949c769b78670e40bcc4f78caab1d355d617db0d874107b9a5b96b92cc5ec43ce2fc5683efe3'
            'b8dfabc4c8bc9d8f6d7f066d9a30eff9a0aba9ca26547811bfdc7fe26cfc224ed9a40adba6da39907a49c88bd647ace1ff7be3f87e02fe6f8efb7d17275da61b'
            '524281deffd9d9b3e5fc1bcbf4d88581048e52acdaf25220d895773d88db12760f331277cb8e7d6e9b8ecbedba818227d7d83821f53315d68b8c47cc98fd7c52'
            '221af341f5f9621807ee5fed69c464ff0b43e98ae07fe08f1559af844d3fdfb2ca8f50a9e1c07c0d95da896b852598850f479ae7c346a69a6707afade05884d1'
            '45576ea9b063ca8bf3b0620da064a7e6d49172c5476533e37681260d74f7bc02e8a51066a849dba786a543c17ecfc48f58c7668e064c157034902f6154c66a0b'
            'ac27c3fb1768407614fb01252603c7a42968623c617aef40d0d9dca1eda19561ba742846f37245a3eee8e2571d43dc5f17a95b19ad427ca216c86c87907db5a6')
