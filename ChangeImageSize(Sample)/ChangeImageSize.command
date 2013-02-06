#
# 
# 將原始圖片重新取名為 -hd & @2x
# 並將原來的圖片縮1/2大小
# 試用於iPhone iPad UI相關圖片重新命名時使用
#
#!/bin/sh

ABSPATH=$(cd "$(dirname "$0")"; pwd) 
echo \"$ABSPATH\"

cd "$ABSPATH"/

mkdir 0-small
mkdir 0-hd
mkdir 0-2x

#
# 先將圖片copy一份到 hd and 2x資料夾
# 並修改名稱
#
for file in *.png
do
   name=$(basename -s .png $file) 
   name2=${name##*/}
   name3=${name2%%.*}
   target1=./0-hd/"$name3-hd.png"
   target2=./0-2x/"$name3@2x.png"
#   echo $file
#   echo $target1
   
   cp $file $target1
   cp $file $target2
done



#
# 再copy原圖至small並縮小之
#
#
cp *.png ./0-small
cd ./0-small
for file in *.png
do
   w=`sips -g pixelWidth $file | tail -1 | sed "s/.* //"`
   h=`sips -g pixelHeight $file | tail -1 | sed "s/.* //"`
   let tw=w/2
   let th=h/2
   sips -z $th $tw "$file"
done

exit 0