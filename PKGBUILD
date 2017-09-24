# By MBC (Matteo's Basic Computing)
# Maintainer : Matteo Rossillol <mbasiccomputing(at)gmail(dot)com>


_dname=navigraph-fms-data-manager
pkgname=navigraph-fms-data-manager-beta
pkgver=1.6.1.1129   
pkgrel=1
arch=("x86_64")
url="https://www.navigraph.com/FmsDataManager.aspx"
pkgdesc="It's a client software which allows you to effortlessly download and install FMS Data for your flight simulation addons and tools." 
license=("custom:commercial")
groups=("MBC")
depends=("zlib" "mesa" "libxcb" "glibc>=2.19")
source=("http://download.navigraph.com/software/fmsdatamanager/$_dname-$pkgver.$arch.rpm"
        "COPYING")
sha256sums=('bbb7d69f4c74f5ea3eabd24742ed7c96acc9634c6c485359e13f52276daee57b'
            '9ba364164734166c653ada50f16d71926cbc79445d98bfec65bee13f3d138a57')
            
package()
{
    cd $srcdir
    cp -r usr $pkgdir
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 COPYING $pkgdir/usr/share/licenses/$pkgname
}
