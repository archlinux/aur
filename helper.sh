#!/bin/bash 

# $1 = package name
# $2 = target directory path
# $3 = branch/commit/revision string, if empty then maste ist used
function go_get {
  if [[ $1 == github.com* ]]
  then 
    get_git $1 $2 $3
  elif [[ $1 == code.google.com* ]]
  then 
    get_hg $1 $2 $3
  else
    go get $1
  fi
}

# $1 = git package
# $2 = target directory path
# $3 = branch/commit/revision string, if empty then maste ist used
function get_git {
  git clone https://$1 $2
  if [[ $3 != "master" ]] && [[ ${3:0} == commit* ]]
  then
    cd $2
    git checkout ${3:7}
  elif [[ $3 != "master" ]] && [[ ${3:0} == tag* ]]
  then
    cd $2
    git checkout tags/${3:4}
  else
    cd $2
    git checkout ${3:7}
  fi
}

# $1 = mercury package name
# $2 = target directory path
# $3 = branch/commit/revision string, if empty then maste ist used
function get_hg {
  if [[ $3 == "master" ]] || [[ $3 == "" ]]
  then
    hg clone https://$1 $2
  else
    hg clone https://$1 -r $3 $2
  fi
}

# Read the .gopmfile file and clone the branch/commits of the depends
# $1 = .gopmfile file path
# $2 = target directory path
function get_gopm {
  local startStr=""
  local revStr=""

  while read line
  do
    if [[ $startStr == 'X' ]] && [[ $line == '' ]]
    then
      break
    elif [[ $startStr == 'X' ]]
    then
      IFS="=" read -a array <<< "$line"
      if [[ ${array[1]} != "" ]]
      then
        local revStr=${array[1]//\`}
        go_get ${array[0]} "$2/${array[0]}" $revStr
      else
        go_get ${array[0]} "$2/${array[0]}" master
      fi
    elif [[ $line == '[deps]' ]]
    then
      local startStr="X"
    fi
  done <$1
}