#!/bin/sh

echo `pwd`
# 不能换行
basePath="base.html"
# baseStr=$(cat base.html)

# 换行
baseStr=""
while IFS='' read -r line || [[ -n "$line" ]]; do
	baseStr="$baseStr\n$line"
done < "$basePath"
echo $baseStr

# num=1234
# 以下可以删除替换内容，但是无法在脚本中输出
# echo $baseStr | sed -e "s/<%Replace%>/1234/"
# 需要使用以下方法替换输出
# var="${baseStr/<%Replace%>/1234}"
# echo $var

src="src"
if [ -d $src ] 
	then
	cd $src

	for dir in `ls $1`
	do
		if [ $dir != "public" ]
			then
			echo $dir
			cd $dir

			if [ -f "SUMMARY.html" ]
				then
				sumfile=$(cat SUMMARY.html)
				baseStr=${baseStr/<%Summary%>/${sumfile}}
			fi

			for file in `ls $1`
			do
				if [ $file != "SUMMARY.html" ]
				then
					fileStr=""
					while IFS='' read -r line || [[ -n "$line" ]]; do
						fileStr="$fileStr\n$line"
					done < "$file"
					middleStr=$baseStr
					# 清空文件
					> $file
					# 替换字符串
					replaceStr=${middleStr/<%Replace%>/${fileStr}}
					`echo $replaceStr >> $file`
				fi
			done
			cd ..
		fi
	done

	cd ..
fi

# 内容替换
# sed -i -e "s/<%Replace%>/${num}/g" $basePath
