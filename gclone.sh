apt install wget -y
apt install unzip -y
apt install jq -y
version=$(curl -sL https://api.github.com/repos/dogbutcat/gclone/releases | jq -r ".[0].tag_name")
wget https://github.com/dogbutcat/gclone/releases/download/$version/gclone-$version-`uname -s`-`dpkg --print-architecture`.zip -O gclone.zip
unzip gclone.zip
mv ./gclone*/ gclone
mv ./gclone/gclone /usr/bin/gclone
chmod 777 /usr/bin/gclone
rm -rf ./gclone
rm -rf ./gclone.zip
