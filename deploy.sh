if [ ! -d "/website" ]
then
    mkdir /website
    if [ $? -ne 0 ]
    then
        echo "FATAL: /website created unsuccessfully"
        exit 1
    fi
fi

if [ ! -d "/database" ]
then
    mkdir /database
    if [ $? -ne 0 ]
    then
        echo "FATAL: /database created unsuccessfully"
        exit 2
    fi
fi

if [ ! -d "/var/log/website" ]
then
    mkdir /var/log/website
    if [ $? -ne 0 ]
    then
        echo "FATAL: /var/log/website created unsuccessfully"
        exit 3
    fi
fi

yes | apt install python3-pip && pip3 install flask && pip3 install flask-login && pip3 install flask-sqlalchemy
if [ $? -ne 0 ]
then
    echo "FATAL: packages downloaded unsuccessfully"
    exit 4
fi

export DB_PATH=/database/database.db

wget -P /website https://github.com/James-Yu-2007/flask_web_app/archive/refs/tags/v1.3.zip && cd website && unzip /website/v1.3.zip && rm /website/v1.3.zip && nohup python3 /website/flask_web_app-1.3/main.py > /var/log/website/console.log &
if [ $? -ne 0 ]
then
    echo "FATAL: website published unsuccessfully"
    exit 5
fi
echo SUCCESS