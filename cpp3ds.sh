# allow override
if [ -z $CPP3DS ]; then
  export CPP3DS=/opt/cpp3ds
fi

export PATH=$PATH:$CPP3DS/bin
