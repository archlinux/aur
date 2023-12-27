#!/usr/bin/bash
cd /usr/share/savedesktop
if [ "$1" == "" ]
then 
  python main_window.py
elif [ "$1" == "--background" ]
  then
    python periodic_saving.py
elif [ "$1" == "--sync" ]
  then
    python network_sharing.py
elif [ "$1" == "--start-server" ]
  then
    python server.py
elif [ "$1" == "--help" ]
  then
       echo -e '\033[1mArguments:\033[0m \n None | Run SaveDesktop app (GUI) \n --background | Start periodic saving \n --sync | Sync desktop configuration with other computer \n --start-server | Start HTTP server for synchronization DE config with other computers \n --help | Show this message'
fi

cd
