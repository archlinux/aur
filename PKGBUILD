pkgname='remoteplaydetached-bin'
pkgbase='remoteplaydetached'
_pkgname='RemotePlayDetached'
pkgver=v0.4.1
url='https://github.com/smaTc/RemotePlayDetached'
pkgrel=1
pkgdesc='A simple launcher that is able to launch any external game or application with Steam Remote Play Together Support'
arch=('x86_64')
source=("https://github.com/smaTc/RemotePlayDetached/releases/download/${pkgver}/RemotePlayDetached")
sha256sums=('a53290ac8085960539107414fad19617065967e5747083c53f91c69937100a36')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm0755 "$_pkgname" "$pkgdir"/usr/bin
     
    #curl https://raw.githubusercontent.com/alx365/RemotePlayDetached/master/remoteplaydetached.desktop > remoteplaydetached.desktop
    #sed -i "s#user#${USER}#g" remoteplaydetached.desktop
    #mv remoteplaydetached.desktop ~/.local/share/applications
    
    
    #curl https://raw.githubusercontent.com/alx365/RemotePlayDetached/master/resources/logo.png > remoteplaydetached.png
    #mv remoteplaydetached.png ~/.icons/
    #cd ~/
    #mkdir RemotePlayDetached
    #cd RemotePlayDetached/
    #curl https://raw.githubusercontent.com/alx365/RemotePlayDetached/master/uninstall.sh > uninstall.sh
    #chmod +x uninstall.sh
}
