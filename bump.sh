#!/usr/bin/bash
RELEASE_TYPE="patch"
FROM_TAG=$(git describe --abbrev=0)
RELEASE_TYPE=$1

ARR=(${FROM_TAG//./ })
if [[ $RELEASE_TYPE == "major" ]]
then
  TO_TAG="v$((${ARR[0]:1}+1)).${ARR[1]}.${ARR[2]}";
elif [[ $RELEASE_TYPE == "minor" ]]
then
  TO_TAG="${ARR[0]}.$((${ARR[1]}+1)).${ARR[2]}";
else
  RELEASE_TYPE="patch"
  TO_TAG="${ARR[0]}.${ARR[1]}.$((${ARR[2]}+1))";
fi

echo $RELEASE_TYPE
echo $FROM_TAG
echo $TO_TAG
 
git log --pretty="%h %s" $FROM_TAG.. | while read line; do
  WORDS=($line)
  echo $line
  echo ${WORDS[1]}
done







