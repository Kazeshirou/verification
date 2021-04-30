
PATH=$1
REGEX="digraph ([_A-Za-z1-9]*) \{[^}]*\}.?"

FILE=`/usr/bin/cat $PATH` 
while [[ $FILE =~ $REGEX ]];
do
    echo  "${BASH_REMATCH[0]}" > ${BASH_REMATCH[1]}.dot
    FILE=${FILE#"${BASH_REMATCH[0]}"}
done
