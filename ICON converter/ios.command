# Author:Neil
# Date:2013/01/10
# Warning:
# 好孩子路徑不能有空格不然會爆掉~啾咪 =.<
#
# Note:
# 將遊戲的icon壓縮成不同解析度。
# 先準備兩張圖片一張有圖角的是給Android用的，另外兩張給iPhone & iPad
# 最好是1024*1024以上的(需製作iTunesArtwork)
#
# ./0-iPhone/  & ./0-iPad/
#   ->Icon-72.png
#   ->Icon-72@2x.png
#   ->Icon-Small-50.png
#   ->Icon-Small-50@2x.png
#   ->Icon-Small.png
#   ->Icon-Small@2x.png
#   ->Icon.png
#   ->Icon@2x.png
# ./0-android/
#   ->drawable-hdpi/icon.png 72*72
#   ->drawable-ldpi/icon.png 36*36
#   ->drawable-mdpi/icon.png 48*48
#   ->drawable-xhdpi/icon.png 96*96
#
#
#!/bin/sh

ABSPATH=$(cd "$(dirname "$0")"; pwd) 
echo \"$ABSPATH\"

cd "$ABSPATH"/



# 1.製作目錄
mkdir 0-Android
mkdir 0-iPhone
mkdir 0-iPad

cd 0-android
mkdir drawable-hdpi
mkdir drawable-ldpi
mkdir drawable-mdpi
mkdir drawable-xhdpi

cd ..

# 2.to iPhone
sips -Z 72 iphone.png --out "$ABSPATH"/0-iPhone/Icon-72.png
sips -Z 144 iphone.png --out "$ABSPATH"/0-iPhone/Icon-72@2x.png
sips -Z 50 iphone.png --out "$ABSPATH"/0-iPhone/Icon-Small-50.png
sips -Z 100 iphone.png --out "$ABSPATH"/0-iPhone/Icon-Small-50@2x.png
sips -Z 29 iphone.png --out "$ABSPATH"/0-iPhone/Icon-Small.png
sips -Z 58 iphone.png --out "$ABSPATH"/0-iPhone/Icon-Small@2x.png
sips -Z 57 iphone.png --out "$ABSPATH"/0-iPhone/Icon.png
sips -Z 114 iphone.png --out "$ABSPATH"/0-iPhone/Icon@2x.png
cp iphone.png "$ABSPATH"/0-iPhone/iTunesArtwork

# 3.to iPad
sips -Z 72 ipad.png --out "$ABSPATH"/0-iPad/Icon-72.png
sips -Z 144 ipad.png --out "$ABSPATH"/0-iPad/Icon-72@2x.png
sips -Z 50 ipad.png --out "$ABSPATH"/0-iPad/Icon-Small-50.png
sips -Z 100 ipad.png --out "$ABSPATH"/0-iPad/Icon-Small-50@2x.png
sips -Z 29 ipad.png --out "$ABSPATH"/0-iPad/Icon-Small.png
sips -Z 58 ipad.png --out "$ABSPATH"/0-iPad/Icon-Small@2x.png
sips -Z 57 ipad.png --out "$ABSPATH"/0-iPad/Icon.png
sips -Z 114 ipad.png --out "$ABSPATH"/0-iPad/Icon@2x.png
cp iPad.png "$ABSPATH"/0-iPad/iTunesArtwork

# 4.to Android
sips -Z 72 android.png --out "$ABSPATH"/0-Android/drawable-hdpi/icon.png
sips -Z 36 android.png --out "$ABSPATH"/0-Android/drawable-ldpi/icon.png
sips -Z 48 android.png --out "$ABSPATH"/0-Android/drawable-mdpi/icon.png
sips -Z 96 android.png --out "$ABSPATH"/0-Android/drawable-xhdpi/icon.png

exit 0