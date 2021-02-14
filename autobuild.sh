#! /bin/bash
function block_for_change 
{
  inotifywait -r  -e modify,move,create,delete .
}


while block_for_change; do
  echo CHANGE
  sudo systemctl daemon-reload
  sudo systemctl stop fake-background-webcam@1.service  
  sudo systemctl start fake-background-webcam@1.service  
  sleep 1
  clear
  sudo systemctl status -n40 --no-pager  fake-background-webcam@1.service
  
done
