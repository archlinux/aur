#!/bin/bash
post_install()
{
cat<<EOF

elastic-mapreduce expects you to have a credentials.json file in
/usr/local/elastic-mapreduce. You should use the -c parameter to specify your
own location. I suggest you place the following alias into your ~/.bashrc:
alias elastic-mapreduce="elastic-mapreduce -c \$HOME/.config/elastic-mapreduce/credentials.json"

These credentials are available on the http://aws.amazon.com website under
"Your Account/Access Identifiers" (top right). The file should look something
like this:

$ cat credentials.json
{
  "access-id": "<insert your AWS access id here>",
  "private-key": "<insert your AWS secret access key here>",
  "key-pair": "<insert the name of your Amazon ec2 key-pair here>",
  "key-pair-file": "<insert the path to the .pem file for your Amazon ec2 key pair here>",
  "region": "<The region where you wish to launch your job flows. Should be one of us-east-1, us-west-1, us-west-2, eu-west-1, ap-southeast-1, or ap-northeast-1, sa-east-1>"    
}

See /usr/local/elastic-mapreduce/README for more information
EOF
}
