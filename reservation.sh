#!/bin/bash

# Set up file paths
DATA_DIR="data"
USER_FILE="$DATA_DIR/users.txt"

mkdir -p "$DATA_DIR"
clear

cat << EOF
+-------------------------------------------+
|     BASH Cinema Seat Reservation DBMS     |
+-------------------------------------------+
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃  1. View Currently Showing Movies  ┃
┃  2. View My Reserved Seats         ┃
┃  3. Reserve a Seat                 ┃
┃  4. Exit                           ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
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
