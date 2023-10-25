
echo 'hello'

#判断
a=10
if [ $a -eq 10 ]
then
   echo $a
else
   echo 20
fi

#循环
for i in `seq 10`
do
   echo $i
done

#函数
function foo()
{
    echo "hello"
}
foo