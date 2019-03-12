#!/bin/sh

#DBユーザー
DB_USER="mentabloguser"
#DBパスワード
DB_PASSWORD="Sakasu3859!"
#DB名
DB_NAME="wp_mentablog"
#DBホスト
DB_HOST="localhost"
#wordpressのファイルパス
WORDPRESS_PATH="/var/www/wordpress/"
#バックアップ先
BACKUP_PATH="/root/backup/menta_backup/"
#バックアップ世代数
NUMBER_OF_GENERATIONS="5"
 
DATE=`date +%Y%m%d-%H%M%k`

# mysqldumpの実行(圧縮ファイルで保存する)
eval "mysqldump -u$DB_USER -h$DB_HOST -p$DB_PASSWORD $DB_NAME | gzip > $BACKUP_PATH/wp_$DATE.sql.gz"
# 正常終了しなかったときの処理 
if [ $? -ne 0 ]
then
echo "$DATE:DB backup error." >> $BACKUP_PATH/backup_error.log
exit 1
fi

# 関数: ファイルの削除を行う。
# $1: 削除対象のファイルパス(前方一致)
function deletefile(){
CNT=0
for file in `ls -1t ${1}*`
do
CNT=$((CNT+1))
 
if [ ${CNT} -le $NUMBER_OF_GENERATIONS ]
then
continue
fi
eval "rm ${file}"
done
return
}
 
#旧バックアップファイル削除
deletefile "$BACKUP_PATH/wp_"

