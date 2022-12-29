mkdir /database && mkdir /website && mkdir /var/log/website
if [ $? -ne 0 ]
then
    echo "FATAL: directories created unsuccessfully"
    exit 1
fi

yes | apt install python3-pip && pip3 install flask && pip3 install flask-logi>
if [ $? -ne 0 ]
then
    echo "FATAL: packages downloaded unsuccessfully"
    exit 2
fi

export DB_PATH=/database/database.db

wget -p /website https://github.com/James-Yu-2007/flask_web_app/archive/refs/t>
if [ $? -ne 0 ]
then
    echo "FATAL: deployed unsuccessfully"
    exit 3
else
    echo SUCCESS
fi