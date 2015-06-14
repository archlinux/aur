setenv RADWARE_HOME         /usr
#   these variables point to directories containing various RadWare files
setenv RADWARE_FONT_LOC     $RADWARE_HOME/share/fonts/radware
setenv RADWARE_ICC_LOC      $RADWARE_HOME/share/radware
setenv RADWARE_GFONLINE_LOC $RADWARE_HOME/share/doc/radware

#   this variable specifies whether to ring the bell in RadWare cursor routines
setenv RADWARE_CURSOR_BELL y
# setenv RADWARE_CURSOR_BELL n

#   this variable specifies whether to overwrite existing files
setenv RADWARE_OVERWRITE_FILE ask
# setenv RADWARE_OVERWRITE_FILE y
# setenv RADWARE_OVERWRITE_FILE n

#   this variable specifies whether to require the return key in Y/N questions
setenv RADWARE_AWAIT_RETURN n
# setenv RADWARE_AWAIT_RETURN y

#   this variable specifies the requested initial size of the level scheme
#     display in xmgls, xmesc and xmlev (width and height in pixels)
setenv RADWARE_XMG_SIZE 600x500
