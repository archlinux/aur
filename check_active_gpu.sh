#!/usr/bin/env sh 

vgaswitcheroo_path='/sys/kernel/debug/vgaswitcheroo/switch'
active_card=`grep '+' $vgaswitcheroo_path|awk '{split($0,a,":"); print a[2]}'`

echo $active_card

