
echo 'hello'

#判断
a=10
if [ $a -eq 10 ]
then
   echo $a
else
   echo 20
fi

#for循环
for i in `seq 10`
do
   echo $i
done


#while循环
i=1
sum=0
while (( i<=100 ))
do
    ((sum+= i))
    ((i++))
done
echo "This sum is: $sum"



#函数
function foo()
{
    echo "hello"
}
foo


#case语句

read num
case $num in
    1)
    echo '这里是1楼'
    ;;
    2)
    echo '这里是2楼'
    ;;
esac