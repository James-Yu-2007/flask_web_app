mkdir /database && mkdir /website && mkdir /var/log/website
if [ $? -ne 0 ]
then 
    echo "FATAL: directories created unsuccessfully"
    exit 1
fi

apt install python3-pip && pip3 install flask && pip3 install flask-login && pip3 install flask-sqlalchemy
if [ $? -ne 0 ]
then 
    echo "FATAL: packages downloaded unsuccessfully"
    exit 2
fi

export DB_PATH=/database/database.db

wget -p /website https://github.com/James-Yu-2007/flask_web_app/archive/refs/tags/v1.0.zip && unzip /website/v1.0.zip && rm /website/v1.0.zip && nohup python3 /website/flask_web_app-1.0/main.py > /var/log/website/console.log
if [ $? -ne 0 ]
then 
    echo "FATAL: deployed unsuccessfully"
    exit 3
fi