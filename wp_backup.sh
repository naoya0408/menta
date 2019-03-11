#!/bin/sh

# 他のユーザからバックアップを読み込めないようにする
umask 077

# バックアップを5日分残しておく設定
period=5

# バックアップファイルを保存するディレクトリ
dirpath='/root/backup/menta_backup/'

# ファイル名を定義(日付をわかるようにしておく)
filename=`date +%y%m%d`

# mysqldumpの実行(圧縮ファイルで保存する)
mysqldump --opt --all-databases --events --default-character-set=binary -u root --password=Sakasitasakasu3859! | gzip > $dirpath/$filename.sql.gz

# 古いバックアップファイルを削除
oldfile=`date --date "$period days ago" +%y%m%d`
rm -f $dirpath/$oldfile.sql.gz
