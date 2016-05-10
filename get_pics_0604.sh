larger="/home/dror/filtered_embryo/larger"
set="set_0604"

function get {
frame=$1
Cat=$2 
framelow=$((frame - 10))
framehigh=$((frame + 9))
mkdir -p  $larger/$set/$1/$Cat
#echo $framelow $framehigh
#for i in `cat ${Cat}_13.txt` ;do echo $seq; for s in `seq $framelow $framehigh` ; do ls -l ~/embryo/$Cat/$i/${i}_RUN${s}.JPG 2> /dev/null ;done;done|wc -l
#for s in `seq $framelow $framehigh` ;do echo $seq; for i in `cat ${Cat}_13.txt`; do ls -l ~/embryo/$Cat/$i/${i}_RUN${s}.JPG 2> /dev/null ;done;done|wc -l
#for s in `seq -w $framelow $framehigh` ;do echo $seq; for i in `cat ${Cat}_0204.txt`; do cp ~/embryo/$Cat/$i/${i}_RUN${s}.JPG $larger/$set/$1/$Cat/ ;done;done 
#for s in `seq -w $framelow $framehigh` ;do echo $seq; for i in `cat ${Cat}_0204.txt|cut -d"_" -f 1-4`; do echo cp ~/embryo/$Cat/$i/${i}_RUN${s}.JPG $larger/$set/$1/$Cat/ ;done;done 
#for i in `cat ${Cat}_0204.txt|cut -d"_" -f 1-4`;do echo $seq; for s in `seq -w $framelow $framehigh`; do echo cp ~/embryo/$Cat/$i/${i}_RUN${s}.JPG $larger/$set/$1/$Cat/ ;done;done 
#for f in `cat ${Cat}_0204.txt`; do i=`echo $f|cut -d"_" -f 1-4`; echo $seq; for s in `seq -w $framelow $framehigh`; do echo cp ~/embryo/$Cat/$i/${i}_RUN${s}.JPG $larger/$set/$1/$Cat/ ;done;done 
#for f in `cat ${Cat}_0204.txt`; do echo "wakakaakakak $f"; i=`echo $f|cut -d"_" -f 1-4`; r=`echo $f|cut -d"_" -f 5|grep -o -e "[0-9]*"`; echo $seq; for s in `seq -w $((r - 10)) $((r + 9))`; do echo cp ~/embryo/$Cat/$i/${i}_RUN${s}.JPG $larger/$set/$1/$Cat/ ;done;done 
for f in `cat ${Cat}_0604.txt`; do
#echo "wakakaakakak $f"
i=`echo $f|cut -d"_" -f 1-4`
#r=`echo $f|cut -d"_" -f 5|grep -o -e "[0-9]*"|sed "s/^0//g"`
#r=`echo $f|cut -d"_" -f 5|grep -o -e "[0-9]*"`
r=`echo $f|cut -d"_" -f 5|grep -o -e "[0-9]*"|sed "s/^0//g"`
#r=`echo $f|cut -d"_" -f 5|grep -o -e "[0-9]*"`
#r=$((r - 100))
r=$((r + frame ))
#echo $seq
#for s in `seq -w $((r - 10)) $((r + 9))`; do 
#for s in `seq -f "%03g" $((frame + 10#$r)) $((10#$r + 9))`; do 
#framelow=$((frame - 10#$r)) 
#framehigh=$((frame + 10#$r))`; do 
#for s in `seq -f "%03g" $((frame - 10#$r)) $((frame + 10#$r))`; do 
#echo " frame = $frame r = $r"
#for s in `seq -f "%03g" $((frame + 10#$r + 1 )) $((frame + 10#$r + 3 ))`; do 
for s in `seq -f "%03g" $((10#$r + 1 )) $((10#$r + 3 ))`; do 
cp ~/embryo/$Cat/$i/${i}_RUN${s}.JPG $larger/$set/$1/$Cat/ ;done;done 
}

function circle {
for e in `find $larger/$set/$1/$Cat -name *.JPG`;do echo ~/circle $e; done
}

function frame {
Cat=$1
echo $Cat
#for frame in 50 `seq -w 100 50 500`; do get $frame $Cat; circle $frame;done
#for frame in 50 `seq -w 100 50 450`; do get $frame $Cat; done
#for frame in 70 80 90 100 110 120 130 200; do get $frame $Cat; done
for frame in -30 -20 -10 0 10 20 30 100 250; do get $frame $Cat; done
}

frame unseen_good
frame unseen_bad
frame bad
frame good
