apt install wget -y
apt install unzip -y
apt install jq -y
wget https://github.com/dogbutcat/gclone/releases/download/$(curl -sL https://api.github.com/repos/dogbutcat/gclone/releases | jq -r ".[0].tag_name")/gclone-$(curl -sL https://api.github.com/repos/dogbutcat/gclone/releases | jq -r ".[0].tag_name")-`uname -s`-`dpkg --print-architecture`.zip -O gclone.zip
unzip gclone.zip
mv ./gclone*/ gclone
mv ./gclone/gclone /usr/bin/gclone
chmod 777 /usr/bin/gclone
rm -rf ./gclone
rm -rf ./gclone.zip
