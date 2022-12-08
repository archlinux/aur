if [[ $(echo $PYTHONPATH) ]]
then
	export PYTHONPATH=$PYTHONPATH:/usr/lib
else
	export PYTHONPATH=/usr/local/lib
fi
