#! /bin/bash
grep -P '[a-zA-Z0-9\.]+@[a-zA-Z0-9\-]+\.com, \d[^\№\:\?\$\\\#\!\%\^\&\*\(\+\=]\d+$' user_data_task2.txt > user1.txt
while IFS=', ' read -r ID NAME SURNAME EMAIL PASSWORD; do
    echo "\"${EMAIL}\":${NAME}'s password is ${PASSWORD}, it should be improved!"
done < user1.txt
