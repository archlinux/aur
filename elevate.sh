    # Elevate (fixed)
    if [ -x "$GKSUDO" ]; then
         $GKSUDO --description $DESKFILE $RSSTARTUP $@
    elif [ -x "$KDESUDO" ]; then
        $KDESUDO $RSSTARTUP --- "$envi" $@
    elif [ -x "$PKEXEC" ]; then
        $PKEXEC $RSSTARTUP --- "$envi" $@
    else
        $TRAMPLIN $@ > /dev/null 2>&1
    fi

fi
