pkgbase='deluge-plugins'
pkgname=('deluge-movetools' 'deluge-labelplus' 'deluge-smartmove' 'deluge-stats' 'deluge-webapi')
pkgver=1
pkgrel=1
pkgdesc="Various Deluge plugins"
arch=('any')
url='http://dev.deluge-torrent.org/wiki/Plugins#Plugins3rdParty'
license=('GPL3')
depends=('deluge' 'gtk2')
source=("https://github.com/ratanakvlun/deluge-movetools/releases/download/v0.2.0.2/MoveTools-0.2.0.2-py2.7.egg"
        "https://github.com/ratanakvlun/deluge-labelplus/releases/download/v0.3.2.2/LabelPlus-0.3.2.2-py2.7.egg"
        "https://github.com/downloads/megaumi/smart-move/SmartMove-0.1-py2.7.egg"
        "https://github.com/downloads/ianmartin/Deluge-stats-plugin/Stats-0.3.2-py2.7.egg"
        "https://pypi.python.org/packages/2.7/d/deluge-webapi/deluge_webapi-0.1.0-py2.7.egg")
md5sums=('344a8aa43a721181c7da8d768405d727'
         'b77620bc9ada8c09314414fdeb4fe8d4'
         'c0d1de728c46e03ddaa6bf779a036534'
         '6461ab8036c681f15b2eb7dc48d3dbe2'
         '7969b188607228c322676c1c564259f5')

file_suffix=py2.7.egg

package_deluge-movetools() {
  pkgdesc='Plugin for Deluge that shows the move status of a torrent.'
  url='http://forum.deluge-torrent.org/viewtopic.php?f=9&t=42623'

  install -Dm644 MoveTools-0.2.0.2-"$file_suffix" "$pkgdir"/usr/lib/python2.7/site-packages/deluge/plugins/MoveTools-0.2.0.2-"$file_suffix"
}

package_deluge-labelplus() {
  pkgdesc='Plugin for Deluge that can be used to organize torrents by assigning labels.'
  url='http://forum.deluge-torrent.org/viewtopic.php?f=9&t=42629'

  install -Dm644 LabelPlus-0.3.2.2-"$file_suffix" "$pkgdir"/usr/lib/python2.7/site-packages/deluge/plugins/LabelPlus-0.3.2.2-"$file_suffix"
}

package_deluge-smartmove() {
  pkgdesc='Plugin for Deluge that improves its "move storage" functionality.'
  url='http://forum.deluge-torrent.org/viewtopic.php?f=9&t=40835'

  install -Dm644 SmartMove-0.1-"$file_suffix" "$pkgdir"/usr/lib/python2.7/site-packages/deluge/plugins/SmartMove-0.1-"$file_suffix"
}

package_deluge-stats() {
  pkgdesc='Plugin for Deluge that displays pretty graphs much like the utorrent speed tab.'
  url='http://dev.deluge-torrent.org/wiki/Plugins/Stats'

  install -Dm644 Stats-0.3.2-"$file_suffix" "$pkgdir"/usr/lib/python2.7/site-packages/deluge/plugins/Stats-0.3.2-"$file_suffix"
}

package_deluge-webapi()  {
  pkgdesc='Plugin for Deluge WebUI providing sane JSON API.'
  url='https://pypi.python.org/pypi/deluge-webapi'
  depends=('deluge')

  install -Dm644 deluge_webapi-0.1.0-"$file_suffix" "$pkgdir"/usr/lib/python2.7/site-packages/deluge/plugins/deluge_webapi-0.1.0-"$file_suffix"
}
