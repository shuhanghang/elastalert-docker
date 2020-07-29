#!/bin/sh
rules_path=/home/rules
rules=''
for file in $rules_path/*;do
    rules="$rules --rule $file"
done
python3 -m elastalert.elastalert --config /home/config.yml $rules --verbose
