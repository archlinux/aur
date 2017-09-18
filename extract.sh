#!/bin/sh
# HVR-12x0-14x0-17x0_1_25_25271_WHQL.zip
# f26a8 (992936) = firmware offset

SUM=`md5sum HVR-12x0-14x0-17x0_1_25_25271_WHQL.zip`
if [ "$SUM" != "7fe395c1a398f079d98e416ee7be3777  HVR-12x0-14x0-17x0_1_25_25271_WHQL.zip" ]
then
    echo "Invalid zip archive, either corrupt or incorrect version"
    exit
fi

echo "Extracting hcw85enc.rom from the windows zip file"
unzip -jo HVR-12x0-14x0-17x0_1_25_25271_WHQL.zip Driver85/hcw85enc.rom
if [ $? -ne 0 ]
then
    echo "Failed to extract file, aborting"
    exit
fi

mv hcw85enc.rom v4l-cx23885-enc.fw

echo "Extracting hcw85mlC.rom from the windows zip file"
unzip -jo HVR-12x0-14x0-17x0_1_25_25271_WHQL.zip Driver85/hcw85mlC.rom
if [ $? -ne 0 ]
then
    echo "Failed to extract file, aborting"
    exit
fi

mv hcw85mlC.rom v4l-cx23885-avcore-01.fw

SUM=`md5sum v4l-cx23885-enc.fw`
if [ "$SUM" != "1cb3c48a6684126f5e503a434f2d636b  v4l-cx23885-enc.fw" ]
then
    echo "Error extracting firmware, failed md5 check"
    exit
else
    echo "Firmware extracted successfully"
fi

SUM=`md5sum v4l-cx23885-avcore-01.fw`
if [ "$SUM" != "b3704908fd058485f3ef136941b2e513  v4l-cx23885-avcore-01.fw" ]
then
    echo "Error extracting firmware, failed md5 check"
    exit
else
    echo "Firmware extracted successfully"
fi

echo "Now manually copy firmware into your firmware dir"
echo "  E.g. sudo cp v4l-cx23885-enc.fw /lib/firmware/`uname -r`"
echo "  E.g. sudo cp v4l-cx23885-avcore-01.fw /lib/firmware/`uname -r`"
