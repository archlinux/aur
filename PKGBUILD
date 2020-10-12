# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=firefox-extension-arch-search
pkgver=1.0.1
pkgrel=1
pkgdesc="A set of Web Extensions that adds ArchLinux (bug tracker, forum, packages, wiki, AUR) as a search engine to the Firefox browser."
arch=('any')
url="https://github.com/noraj/firefox-extension-arch-search"
license=('MIT')
groups=('firefox-addons')
depends=("firefox")
replaces=('arch-firefox3-search' 'arch-firefox-search')
source=("https://addons.mozilla.org/firefox/downloads/file/3658546/archlinux_aur_search-$pkgver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/3658547/archlinux_bugtracker_by_fs_search-$pkgver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/3658548/archlinux_bugtracker_by_text_search-$pkgver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/3658550/archlinux_forum_by_author_search-$pkgver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/3658551/archlinux_forum_by_keywords_search-$pkgver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/3658552/archlinux_packages_search-$pkgver-fx.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/3658553/archlinux_wiki_search-$pkgver-fx.xpi"
        "https://raw.githubusercontent.com/noraj/$pkgname/master/LICENSE")
noextract=("archlinux_aur_search-$pkgver-fx.xpi"
           "archlinux_bugtracker_by_fs_search-$pkgver-fx.xpi"
           "archlinux_bugtracker_by_text_search-$pkgver-fx.xpi"
           "archlinux_forum_by_author_search-$pkgver-fx.xpi"
           "archlinux_forum_by_keywords_search-$pkgver-fx.xpi"
           "archlinux_packages_search-$pkgver-fx.xpi"
           "archlinux_wiki_search-$pkgver-fx.xpi")
b2sums=('d35be5d40e3b78c40043fc6d4aa3c652df39c57e57b4b0e97c0e5907305d62a53e5bfbba88b55ee8e92c800651c16055e78dd70a1c9462f370dba4fac92abf88'
        '972218e036ba1b4b6371e290cfc7c0e1f2282422dab54ec83dccab7db14fa8d12c401439be49a62dc223d8fbb2b09ef2f872844c4db2310ee4027c1e0ddf2cf9'
        '1cb57b7de8233c51c0e6a0f3a746c22b1ba374a6b1dfedd6b34b58631dbb3e299158ca08ba36ed2aaa93ac2b939f99a132929fad817acec5e50a06d7bb030d5c'
        '6793d5b2eacb81e787b4880dd0de5175911f04dffa8521a55235a5762fa298676f289f7713a3a29bdee825f703557fd3631d278656c2f3347691d93daea927e7'
        '7eaf055663269d4f2f5f5cc2c1f80ddcc9126bb4218cdf34f057e251f3b406095f0fef46949423c6a742ecf9918f6be2eded95afc4298240f503c09ea71ade5a'
        '9702895d73c830b44c7f961b7e92493b6a599bd4a9d47c6a982b1e460e99fa539b8e60839cd5ba10adb30691b0022b67a6135bf329674fcfadedb2053e1bfaca'
        'e2e7a38f44946e98d7b1bf32ad3af39a98c6cebddb1475cfbdf4c6b807a3919dc40e3a7c0c49cc93370f8da35d79863f91dd3d4c2aacefac67ffd0d5945e1259'
        '0d3c9592a3a0e845a5a421876209b1ee5e70024590788f7952bd54df159138c704d16ea994cac4455f2280da3008e03c7fbc0adaee4cdccd75e262b36141b873')

package() {

  install -Dm644 "archlinux_aur_search-$pkgver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchAur@archlinux.org.xpi"
  install -Dm644 "archlinux_bugtracker_by_fs_search-$pkgver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchBugsFs@archlinux.org.xpi"
  install -Dm644 "archlinux_bugtracker_by_text_search-$pkgver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchBugsT@archlinux.org.xpi"
  install -Dm644 "archlinux_forum_by_author_search-$pkgver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchForumA@archlinux.org.xpi"
  install -Dm644 "archlinux_forum_by_keywords_search-$pkgver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchForumK@archlinux.org.xpi"
  install -Dm644 "archlinux_packages_search-$pkgver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchPkgs@archlinux.org.xpi"
  install -Dm644 "archlinux_wiki_search-$pkgver-fx.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/ArchWiki@archlinux.org.xpi"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
