#/bin/python

from subprocess import check_output
from datetime import datetime

commit = check_output(["git", "show", "-s", "--format=%h", "HEAD"]).strip().decode("utf-8")
#timestamp = float(check_output(["git", "show", "-s", "--format=%ct", "HEAD"]).strip())
numCommits = check_output(["git", "rev-list", "--count", "HEAD"]).strip().decode("utf-8")

#print(commit)
#print(timestamp)
#print(datetime.utcfromtimestamp(timestamp).strftime("%Y-%m-%d"))
#print(numCommits)

print("r%s.%s"%(numCommits, commit))

