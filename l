#!/bin/bash
function gen {
case $1 in
     "-t"|"--template")
          templ=$2
          ;;
    *)
	echo "wrong input"
	exit 1
          ;;
esac
case $3 in
    "-r"|"--result")
        result=$4
          ;;
     *)
	echo "wrong input"
	exit 1
          ;;
esac

function replace {
>temp
cat $templ | while read line 
	do
	case $line in
	  *"<--"*"-->")
	echo $line | sed 's/<--/$/g'| sed 's/-->//g' >> temp
	;;
esac
done
eval "echo \"$(cat temp)\"" >$result
}
replace
}
gen $1 $2 $3 $4
exit 0
