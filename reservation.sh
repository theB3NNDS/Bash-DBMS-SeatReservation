#!/bin/bash


BASE_DIR=$(dirname $0)
DATA_DIR=$(dirname $0)/data
movieIndexCount=$(wc -l $DATA_DIR/movies.csv | cut -c1)

menu () {
clear
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

if [ $choice -lt 5 ]; then
    case $choice in
        1)
            clear
            viewMovies
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
else
    menu
    echo "HELLLOOO"
fi

} 

viewMovies () {
    if ! grep -q . "$DATA_DIR/movies.csv"; then
        echo "No data found!"
    else
        while IFS="," read -r rec_itemNo rec_title rec_price rec_timesched
        do
            echo "Title: $rec_title"
            echo "Price: $rec_price"
            echo "Scheduled Screenings: $rec_timesched"
            echo ""
        done < <(tail -n +2 $DATA_DIR/movies.csv)
        


        cat << EOF
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃  1. View Movie Seating                    ┃
┃  2. Reserve a Seat                        ┃
┃  3. Back                                  ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
EOF
        echo "What would you like to do?"
        read choice
        case $choice in
            1)
                echo "chose 1"
                ;;
            2)
                echo "chose 2"
                ;;
            3)
                menu
                ;;
        esac

    fi
}

clear
# initializing .csv file
if [ -f $DATA_DIR/movies.csv ] && [ -f $DATA_DIR/seats.csv ]; then
    menu
else
    echo "Initializing movie database. Please wait..."
    mkdir -p data
    touch movies.csv seats.csv
    echo "1, Bob Marley: One Love, 12:00PM, 2:25PM, 5:35PM, 8:00PM
2, Dune: Part Two, 3:00PM, 8:30PM
3, E-Sarn Zombie, 12:45PM, 6:15PM
4, SPY X FAMILY CODE: White, 12:30 PM, 2:50PM, 5:10PM, 7:30PM
5, Kung Fu Panda 4, 12:00PM, 2:00PM, 4:00PM, 6:00PM, 8:00PM" > movies.csv
    mv seats.csv data/seats.csv
    mv movies.csv data/movies.csv
    sleep 3
    menu
fi
