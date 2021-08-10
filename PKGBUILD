# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=gtk2
pkgname=$_pkgname-maemo
pkgver=2.24.33
_tag=2.24.25
pkgrel=2
pkgdesc="GObject-based multi-platform GUI toolkit (legacy)"
arch=(x86_64)
url="https://www.gtk.org/"
depends=(atk pango libxcursor libxinerama libxrandr libxi libxcomposite libxdamage
         shared-mime-info cairo libcups gtk-update-icon-cache librsvg desktop-file-utils)
makedepends=(gobject-introspection git gtk-doc hicolor-icon-theme)
optdepends=('gnome-themes-standard: Default widget theme'
            'adwaita-icon-theme: Default icon theme'
            'python: gtk-builder-convert')
provides=(libgailutil.so libg{d,t}k-x11-2.0.so)
license=(LGPL)
install=gtk2.install
_commit=68631945733158f164427db84f01301d7e875763  # tags/2.24.33^0
_raw_url="https://raw.githubusercontent.com/maemo-leste/gtk"
source=("$_pkgname::git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
	hildonize-gdk-window.patch::$_raw_url/$_tag/debian/patches/hildonize-gdk-window.diff
	hildonize-gtk-container.patch::$_raw_url/$_tag/debian/patches/hildonize-gtk-container.diff
	hildonize-gtk-dialog.patch::$_raw_url/$_tag/debian/patches/hildonize-gtk-dialog.diff
	hildonize-gtk-entry.patch::$_raw_url/$_tag/debian/patches/hildonize-gtk-entry.diff
	hildonize-gtk-enums.patch::$_raw_url/$_tag/debian/patches/hildonize-gtk-enums.diff
	hildonize-gtk-iconview.patch::$_raw_url/$_tag/debian/patches/hildonize-gtk-iconview.diff
	hildonize-gtk-imcontext.patch::$_raw_url/$_tag/debian/patches/hildonize-gtk-imcontext.diff
	hildonize-gtk-menu.patch::$_raw_url/$_tag/debian/patches/hildonize-gtk-menu.diff
	hildonize-gtk-rbtree.patch::$_raw_url/$_tag/debian/patches/hildonize-gtk-rbtree.diff
	hildonize-gtk-textview.patch::$_raw_url/$_tag/debian/patches/hildonize-gtk-textview.diff
	hildonize-gtk-widget.patch::$_raw_url/$_tag/debian/patches/hildonize-gtk-widget.diff
	hildonize-gtk-window.patch::$_raw_url/$_tag/debian/patches/hildonize-gtk-window.diff
        gtkrc
        gtk-query-immodules-2.0.hook
        xid-collision-debug.patch)
sha512sums=('SKIP'
            'f838b74958b4f5f1f37fb2831c07dfb7ea051fd62c74f17d8848736e1bbd5671b9a8a66e5a34ce131669a05b2e99312fa43a91ef1d456a914f2d308c09412681'
            '809135f8921bf42c0684be6183eb626ec21db87ead3cb3efbfb59d1b6c57f6d2bc61f23cdf54ed6521de1a74c606ed69cb9991332edb938b076baecd805154b2'
            '77c37f91e989b9e6326b9b2c1bf32f5feaa7b81ec5742f5fb1c5b6db07de4efcc9753beadb9517fe8e04983e11d122b5dfd94897bc8bdb2d68cf7dfffdb1b46e'
            '29ea967378c84e907f7a102bcf6cd893c12c25586c95b2a2994e92dd1f1e82996bfb1416cef47a17ff6b8a225a222cd545b2080d45d190d9061a0f1ecf2baf37'
            'a65dc9a3f5e2967d382d8f13781bf446441bea23d84740eaf43e4ce7ee14b3592b7f105f4b89b7246c42f5be9a9e1e9ae93ac23bc6b62ae9c09b45a0eb6a273d'
            '44ba4adcd50c589990af195d3b25baed8098ef8f7f191d841b9ce86bf7e65a48c4e8222a755eca1373eaabe6a79db9c3721f0fa690cca5e5e31fd9b4c3fc69bb'
            'ece16de21b19ccb7b08bad78880fa83765bb562973cf73249a9b2b617e0918e231d54bf64ee82648901c7f6c4af4220b06547dc9a17bbb77fab9e83c08cdcfe7'
            '44cd0f71316f38da52ad0e9db3681bf4fbf83c9175b98bb9241d0bedf3f66ed6923c8aa6c9c26264ee4d7b5f8abb15f2ab7cd9f1eaf037273bf94ec50ff4ea41'
            'd664555b7e7a98a567548d403e3df0d0534312ba6947d422a0d68dddbaa786806a842a25dcb5f4a0e1235a2f64d6920f67bf93b4574540d4af2337e1d5b68f2c'
            'f4c1978b1cbd00cc28779f1cda99434f2f5aec53fd6564282d7d2c5ac5d4869207d38a31ad971bfa09eefe5a78030b3c4c169cbdbd7f5e3b2f7c42bed7f58e56'
            'aa3100404b4fe4509ec52c79384e5e59585d482947e394ad26f9c83ad11c9a19f2b0f66112ba9c74feb7a0c7d1b5ec54c64fac34ec0c03666b3ecb62160db8b6'
            '7622b5ff6cd1c0705eee7ad5789c675055a79a4b0aaf2f25fdab4a6fdf883e6fbdef22145d2f2ce4ada3015bd7a8424f61a325a8d00c80e26bf1b507c7949318'
            'b124433dd4b20d1d62f073df87e253ca23b3b51625cce55f29a220a4369eda5108c0de07fdc686f570232322c3ff04f7758383f2be5aeace40f843907aa3696d'
            '5e99c5558bf48dc251134869c6310bd9e4bce3775a93547f62028fe32b415c18079da89fe46c85d80b54c4810732acbd6b88ec9946962d02fafc46ed7f672cf2'
            'c473ac89fab47cc79e912695aa7408c22c4bcd998e00f9b00d46374d4a961d41ffaa1f885bf2f9d9b68a401e16f64c617f0dfb058a98469dbe16beb37229b9bc')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  git apply -3 ../xid-collision-debug.patch
  patch -p1 < ../hildonize-gdk-window.patch
  patch -p1 < ../hildonize-gtk-container.patch
  patch -p1 < ../hildonize-gtk-dialog.patch
  patch -p1 < ../hildonize-gtk-entry.patch
  patch -p1 < ../hildonize-gtk-enums.patch
  patch -p1 < ../hildonize-gtk-iconview.patch
  patch -p1 < ../hildonize-gtk-imcontext.patch
  patch -p1 < ../hildonize-gtk-menu.patch
  patch -p1 < ../hildonize-gtk-rbtree.patch
  patch -p1 < ../hildonize-gtk-textview.patch
  patch -p1 < ../hildonize-gtk-widget.patch
  patch -p1 < ../hildonize-gtk-window.patch
  libtoolize --force
  aclocal -I m4
  autoconf
  automake --add-missing
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname

  ./configure \
    --build=$CBUILD \
    --host=$CHOST \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-xinput=yes \
    --without-libjasper \ # try without
    --with-included-loaders=png
    --disable-gtk-doc

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd _pkgname
  make DESTDIR="$pkgdir" install

  install -Dt "$pkgdir/usr/share/gtk-2.0" -m644 ../gtkrc
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 ../gtk-query-immodules-2.0.hook

  rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}

# vim:set et sw=2:
