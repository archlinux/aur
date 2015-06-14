# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=claws-mail-tango-theme
pkgver=1.2.1
pkgrel=3
pkgdesc="Tango-theme for claws"
url="http://www.claws-mail.org/themes.php"
arch=(any)
conflicts=('claws-mail-themes')
license=('public domain')
depends=('claws-mail' 'tango-icon-theme')
options=(!strip !zipman)
source=(http://www.claws-mail.org/download.php?file=themes/png/claws-mail-theme_Tango_${pkgver}.tar.gz)
md5sums=('cae47d9b8663e28f3a00810919d96177')

package() {
  mkdir -p $pkgdir/usr/share/claws-mail/themes/Tango
  cd $pkgdir/usr/share/claws-mail/themes/Tango
  cp $srcdir/Tango_v1.2.1/*.png ./

  LN() {
    ln -sf /usr/share/icons/Tango/"$1"x"$1"/"$3".png ./"$2".png
  }

  LN 16 addr_two           apps/system-users
  LN 16 address_book       mimetypes/x-office-address-book
  LN 16 address_search     actions/system-search
  LN 16 book               mimetypes/x-office-address-book
  LN 16 cancel             actions/process-stop
  LN 16 category           status/folder-visiting
  LN 16 clip               status/mail-attachment
  LN 16 delete_btn         actions/edit-delete
  LN 16 down_arrow         actions/go-down
  LN 16 edit_extern        apps/accessories-text-editor
  LN 16 error              status/dialog-error
  LN 16 exec               categories/applications-system
  LN 16 group              apps/system-users
  LN 22 ham_btn            actions/mail-mark-not-junk
  LN 16 ldap               places/network-server
  LN 22 linewrap           actions/format-justify-left
  LN 22 mail               devices/media-floppy
  LN 22 mail_attach        status/mail-attachment
  LN 22 mail_compose       actions/mail-message-new
  LN 22 mail_forward       actions/mail-forward
  LN 22 mail_receive       actions/mail-send-receive
  LN 22 mail_receive_all   actions/mail-send-receive
  LN 22 mail_reply         actions/mail-reply-sender
  LN 22 mail_reply_to_all  actions/mail-reply-all
  LN 16 mime_application   mimetypes/application-x-executable
  LN 16 mime_audio         mimetypes/audio-x-generic
  LN 16 mime_calendar      mimetypes/x-office-calendar
  LN 16 mime_image         mimetypes/image-x-generic
  LN 16 mime_message       apps/internet-mail
  LN 16 mime_pgpsig        mimetypes/application-certificate
  LN 16 mime_text_enriched mimetypes/x-office-document
  LN 16 mime_text_html     mimetypes/text-html
  LN 16 mime_text_plain    mimetypes/text-x-generic
  LN 16 mime_unknown       mimetypes/text-x-generic-template
  LN 22 news_compose       apps/internet-news-reader
  LN 22 notice_error       status/dialog-error
  LN 22 notice_note        status/dialog-information
  LN 22 notice_warn        status/dialog-warning
  LN 16 offline            status/network-offline
  LN 16 online             status/network-idle
  LN 22 open_mail          apps/internet-mail
  LN 22 paste              actions/edit-paste
  LN 22 preferences        categories/preferences-system
  LN 22 printer            devices/printer
  LN 22 properties         actions/document-properties
  LN 16 replied            actions/edit-redo
  LN 22 search             actions/edit-find
  LN 22 spam_btn           actions/mail-mark-junk
  LN 22 trash_btn          places/user-trash
  LN 16 trash_close        places/user-trash
  LN 16 trash_open         places/user-trash
  LN 24 tray_unreadmail    apps/internet-mail
  LN 22 up_arrow           actions/go-up

  chmod +r {close,complete,continue}.png

  ln -sf trash_close_hrm.png trash_open_hrm.png
  ln -sf trash_close_hrm_mark.png trash_open_hrm_mark.png
  ln -sf trash_close_mark.png trash_open_mark.png
}