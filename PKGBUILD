# Maintainer: Eric Engestrom <aur@engestrom.ch>

_TARBALL_PKGVER=1.3.0-12
_UPLOAD_DATE=20231214

 pkgname=xencelabs
 pkgver=${_TARBALL_PKGVER/-/.}
 pkgrel=1
 pkgdesc='Drivers for the Xencelabs Pen Tablets and Pen Display'
 arch=(x86_64)
 url='https://www.xencelabs.com'
 license=(LGPL3)
 install=$pkgname$_TARBALL_PKGVER.install
 source_x86_64=("https://www.xencelabs.com/support/file/id/46/type/1")
 sha256sums_x86_64=('870d16df231e983c1e2a1745d662bc47f3e60027dd2b0f30f17fbcfc6c425b48')




 prepare() {
  rm -rf $pkgname$_TARBALL_PKGVER.$CARCH
  tar -xf linux/$pkgname-$_TARBALL_PKGVER.tar.gz
  tar -xf linux/xencelabs-1.3.0-12.tar.gz
}

build() {
  cd $pkgname-$_TARBALL_PKGVER

}
 package(){

 mkdir ~/.local/share/xencelabs/
 mkdir /usr/lib/xencelabs/config

 mv ~/.local/share/xencelabs/* /usr/lib/xencelabs/config/

 cd ..

}
