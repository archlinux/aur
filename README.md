# PS4-Discord
PS4 Discord integration Using Python And FTP
It was made to use as background process it take 34.4 mb of ram not much
but I am look for ways to optimize it in future. 


<h1>Dependencies</h1>

```
pip install request
pip install pypresence
```


<p>I recoment to setup a venv for this script with :</p>

```
python3 -m venv venv
```
<p>and only then install a Dependencies with: </p>

```
source venv/activate/bin
python3 -m pip install request
python3 -m pip install pypresence
```

<h5>
  request for parsing Sony API
</h5>
<h5>
  pypresence for Showing Game Status in Discord
</h5>



<h1>Problems & Solutions</h1>
<p>if you want to change something in config file</p>
<p>it locates in same directory as main.py file, if it's not exist or script cant create one, you can create file with name Config.json and put this  { "IP": "YOUR PS4 IP" }  inside </p>
