#!/bin/bash

menu () {
cat << EOF
+-------------------------------------------+
|     BASH Cinema Seat Reservation DBMS     |
+-------------------------------------------+
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃  1. View Currently Showing Movies         ┃
┃  2. Reserve a seat                        ┃
┃  3. Delete an Entry                       ┃
┃  4. Exit                                  ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
EOF
echo What would you like to do? 
read choice

case $choice in
    1)
        echo "You chose 1"
        ;;
    2)
        echo "You chose 2"
        ;;
    3)
        echo "You chose 3"
        ;;
    4)
        echo "You chose 4"
        ;;
esac
} 

viewMovies () {
    
}


clear
# initializing .csv file
if [ -f $(pwd)/data/movies.csv ] && [ -f $(pwd)/data/seats.csv ]; then
    menu
else
    echo "Initializing movie database. Please wait..."
    mkdir -p data
    touch movies.csv seats.csv
    mv movies.csv data/movies.csv
    mv seats.csv data/seats.csv
    sleep 3
    menu
fi
