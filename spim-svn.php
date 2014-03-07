<?php
$url = 'http://sourceforge.net/p/spimsimulator/code/feed';
$dom = new SimpleXMLElement($url, 0, true);
$pattern = '/^http:\/\/sourceforge\.net\/p\/spimsimulator\/code\/(\d+)\/$/';
$newestLink = $dom->channel->item[0]->link;
if(preg_match($pattern, $newestLink, $result) === 1)
{
    echo 'Revision: '.$result[1]."\n";
}
else
{
    echo "Error occurred\n";
}
?>
