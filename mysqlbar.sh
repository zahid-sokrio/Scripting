############################---Description---###################################
#                                                                             #
#   Summary : Show a progress bar for MySQL Database Dump                     #
#   Author  : Zahid Ahmed                                                     #
#   Created Date : May 29,2023                                                #
#   Latest Modified Date : May 29,2023                                        #
#                                                                             #
################################################################################

#!/bin/bash

# Database connection details
db_host="localhost"
db_user="username"
db_password="password"
database="database_name"

# Backup file path
backup_file="/path/to/backup.sql"'date +"%Y%m%d'

# Determine the total number of tables in the database
total_tables=$(mysql -h "$db_host" -u "$db_user" -p"$db_password" "$database" -e "SHOW TABLES" | wc -l)

# Backup each table one by one
table_count=0

mysql -h "$db_host" -u "$db_user" -p"$db_password" "$database" -e "SHOW TABLES" --skip-column-names | while read -r table_name; do
    table_count=$((table_count + 1))

# Perform the raw full backup including triggers using mysqldump
mysqldump -h "$db_host" -u "$db_user" -p"$db_password" --single-transaction --routines --triggers --events --no-create-db --no-create-info --skip-opt --complete-insert "$database" > "$backup_file"

    # Calculate progress
    progress=$((table_count * 100 / total_tables))

    # Clear the line and print the progress bar
    printf "\r[%-50s] %d%%" "$(printf '#%.0s' $(seq 1 $((progress / 2))))" "$progress"
done

printf "\nBackup complete!\n"
