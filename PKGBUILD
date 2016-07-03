# Maintainer: Holodoc
pkgname=jdownloader2
pkgver=latest
pkgrel=10
pkgdesc='Download manager, written in Java, for one-click hosting sites like Rapidshare and Megaupload. Uses its own updater.'
arch=('any')
conflicts=('jdownloader')
replaces=('jdownloader')
url='http://jdownloader.org/'
license=('GPL')
depends=('java-runtime' 'wget' 'bash' 'hicolor-icon-theme' 'unzip' 'shared-mime-info' 'desktop-file-utils' 'fontconfig' 'ttf-dejavu')
optdepends=('phantomjs: needed for some remote capture solving')
install='jdownloader.install'
source=('JDownloader'
        'JDownloaderHeadless'
        'changeUser'
        'JDownloaderHeadlessCleanLogin'
        'jdownloader.xml'
        'jdownloader.desktop'
        'jd-containers.desktop'
        'jd-container16.png'
        'jd-container22.png'
        'jd-container24.png'
        'jd-container32.png'
        'jd-container48.png'
        'jd-container256.png'
        'jdownloader16.png'
        'jdownloader22.png'
        'jdownloader24.png'
        'jdownloader32.png'
        'jdownloader48.png'
        'jdownloader256.png'
        'jdownloader.service' )
sha256sums=('42796e98aa678e69e6c08d37302dac1f922b113371406ef0a8d5db45fa66d1ee'
            '79c383f7e875c3c3e4781a58e2244b5cb5458cc70f0664f5a26e20979326a7d7'
            '6a44f5719a2c9898ef901b2fde3ec026c268c60e6514b83737a07355f9285e7e'
            'd572f8c2be60e013bc8a18c1179f22766ee6885bf02dbdb9c9095371ac31c408'
            
            'c4301592694b3273ed44814debcc03bf1e4fc85882954f5c03e55508c53c4491'
            '44a499df472328f9034f9972aad02df0fc27a45ef1bb3e9314576d2fa9fdfcbe'
            '92cfbe543ee1f9e094347dbd9c0c6a59bd52974145f00dbece8ed0da9a828bfa'
            '16d70dfefe6d4d655313ff2784d2d259287d09634236e17a8c0ba00eac136274'
            '69d99b5d27c847eb7d99ea4e49adba2a5ac1cb12ce10eb03d38e524d6f12e234'
            '7d6073a968ff0d33a259a622ed34d8a58beb9cbdf715a8279b384546b1b4df38'
            '69ad34361769c576422bc245b910c4e0e8ed89e75435ac0a3aced9911872aaca'
            '271b10840c2d9df2c94deb28ac1477c3f3424a7cd0033e41f09615dddefa0947'
            '896eb67760bf0f3b2527b1f0cebee6cb0d16499af8961cb38bb5dca3e6d27d07'
            'b7cad9813e641eddf82571609346bb3a9cdb75e57ffa0a43fbc75721af2bc99c'
            '02ecfb160b7973f5739357e4676556a0f9e01df5b655eab40fe89f463514259a'
            'a10a45298541c025f28e9a084a87ab89a53428a00a50a9944ed3bac7978340fd'
            'cb63ab195ff1b876b668dbe518f4572971e5e0fe239a627ef67486933fcaed07'
            'b5540647f8120f723fb14747473a96e3ee031ffbc0f097e66c6cfd3431bf4e56'
            '6c7a28ec72c8627e9bf06a58d7f6bfed075632a6743e1c8087dc0fa065261504'
            '639bac9f10edfbedd1bff9d624e2bd2bafc62fc2a85089c296dd1ef39b25c83c')
package() {
  install -d -m755 "$pkgdir/opt/JDownloaderScripts"
  install -D -m755 "$srcdir/JDownloader" "$pkgdir/opt/JDownloaderScripts/JDownloader"
	install -D -m755 "$srcdir/JDownloaderHeadless" "$pkgdir/opt/JDownloaderScripts/JDownloaderHeadless"
  install -D -m755 "$srcdir/changeUser" "$pkgdir/opt/JDownloaderScripts/changeUser"
	install -D -m755 "$srcdir/JDownloaderHeadlessCleanLogin" "$pkgdir/opt/JDownloaderScripts/JDownloaderHeadlessCleanLogin"
	
  
  install -D -m644 "$srcdir/jdownloader.xml" "$pkgdir/usr/share/mime/packages/jdownloader.xml"
	install -D -m644 "$srcdir/jdownloader.desktop" "$pkgdir/usr/share/applications/jdownloader.desktop"
	install -D -m644 "$srcdir/jd-containers.desktop" "$pkgdir/usr/share/applications/jd-containers.desktop"
	install -D -m644 "$srcdir/jd-container16.png" "$pkgdir/usr/share/icons/hicolor/16x16/mimetypes/jd-container.png"
	install -D -m644 "$srcdir/jd-container22.png" "$pkgdir/usr/share/icons/hicolor/22x22/mimetypes/jd-container.png"
	install -D -m644 "$srcdir/jd-container24.png" "$pkgdir/usr/share/icons/hicolor/24x24/mimetypes/jd-container.png"
	install -D -m644 "$srcdir/jd-container32.png" "$pkgdir/usr/share/icons/hicolor/32x32/mimetypes/jd-container.png"
	install -D -m644 "$srcdir/jd-container48.png" "$pkgdir/usr/share/icons/hicolor/48x48/mimetypes/jd-container.png"
	install -D -m644 "$srcdir/jd-container256.png" "$pkgdir/usr/share/icons/hicolor/256x256/mimetypes/jd-container.png"
	install -D -m644 "$srcdir/jdownloader16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/jdownloader.png"
	install -D -m644 "$srcdir/jdownloader22.png" "$pkgdir/usr/share/icons/hicolor/22x22/apps/jdownloader.png"
	install -D -m644 "$srcdir/jdownloader24.png" "$pkgdir/usr/share/icons/hicolor/24x24/apps/jdownloader.png"
	install -D -m644 "$srcdir/jdownloader32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/jdownloader.png"
	install -D -m644 "$srcdir/jdownloader48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/jdownloader.png"
	install -D -m644 "$srcdir/jdownloader256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/jdownloader.png"
	install -D -m644 "$srcdir/jdownloader.service" "$pkgdir/usr/lib/systemd/system/jdownloader.service"
	install -d -m755 "$pkgdir/opt/JDownloader"
  
  mkdir -p "$pkgdir/usr/bin"
  
  ln -s "/opt/JDownloaderScripts/JDownloader"  "${pkgdir}/usr/bin/JDownloader"
	ln -s "/opt/JDownloaderScripts/JDownloader" "${pkgdir}/usr/bin/jdownloader"
  ln -s "/opt/JDownloaderScripts/JDownloaderHeadless" "${pkgdir}/usr/bin/JDownloaderHeadless" 
  
  ln -s "/opt/JDownloaderScripts/JDownloaderHeadlessCleanLogin" "${pkgdir}/usr/bin/JDownloaderHeadlessCleanLogin" 
}
