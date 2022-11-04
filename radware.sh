export PATH=$PATH:/opt/radware/bin
export RADWARE_HOME=/opt/radware

#   these variables point to directories containing various RadWare files
export RADWARE_FONT_LOC=$RADWARE_HOME/font
export RADWARE_ICC_LOC=$RADWARE_HOME/icc
export RADWARE_GFONLINE_LOC=$RADWARE_HOME/doc

#   this variable specifies whether to ring the bell in RadWare cursor routines
export RADWARE_CURSOR_BELL=y
# export RADWARE_CURSOR_BELL=n

#   this variable specifies whether to overwrite existing files
export RADWARE_OVERWRITE_FILE=ask
# export RADWARE_OVERWRITE_FILE=y
# export RADWARE_OVERWRITE_FILE=n

#   this variable specifies whether to require the return key in Y/N questions
export RADWARE_AWAIT_RETURN=n
# export RADWARE_AWAIT_RETURN=y

#   this variable specifies the requested initial size of the level scheme
#     display in xmgls, xmesc and xmlev (width and height in pixels)
export RADWARE_XMG_SIZE=600x500
