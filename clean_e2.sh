while read i
do
sub=`echo $i|tr -d "[]"|cut -d" " -f1`
bad=`echo $i|tr -d "[]"|cut -d" " -f2`
good=`echo $i|tr -d "[]"|cut -d" " -f3`

#echo "$sub $bad $good"
echo -n "$sub "

echo -n $bad | grep -e "[0-9\.]*e[+-][0-9]*" > /dev/null
if [ $? -eq 0 ]; then
printf '%.08f' $bad
else
echo -n "$bad "
fi


echo -n $good | grep -e "[0-9\.]*e[+-][0-9]*" > /dev/null
if [ $? -eq 0 ]; then
echo -n " "; printf '%.08f' $good ; echo ""
else
echo  " $good"
fi

#done < results_0604/out_0.txt
done < $1


