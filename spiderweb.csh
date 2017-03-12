setenv SPIDER_DIR "/opt/spider" 
setenv SPBIN_DIR  "$SPIDER_DIR/bin/" 
setenv SPMAN_DIR  "$SPIDER_DIR/man/" 
setenv SPPROC_DIR "$SPIDER_DIR/proc/" 
if ( $?path ) then 
  set path=($path $SPBIN_DIR) 
else 
  set path=($SPBIN_DIR) 
endif 

