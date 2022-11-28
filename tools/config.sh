# clear
echo "=== INCEPTION CONFIGURATION ==="

printf "\nEnter the path where to create your mariadb database and wordpress files"
printf "\nExemple : /home/louis/data\n"
read path

#if this repertory doesn't exist, create it and set the permissions
if [ ! -d "$path" ]; then
    echo "This repertory doesn't exist, please create it"
    exit 1
fi

echo "$path" > tools/data_path.txt

cp tools/template_compose.yml docker-compose.yml

# replace 'path/to/data' by the path entered by the user in srcs/docker-compose.yml
cat docker-compose.yml | sed "s+pathtodata+$path+g" > docker-compose.yml.tmp
mv docker-compose.yml.tmp docker-compose.yml