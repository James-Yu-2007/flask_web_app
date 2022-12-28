mkdir /database && mkdir /website && mkdir /var/log/website
if [ $? -ne 0 ]
then 
    echo "FATAL: directories created unsuccessfully"
    exit 1
fi

apt install pip3
if [ $? -ne 0 ]
then 
    echo "FATAL: pip downloaded unsuccessfully"
    exit 2
fi

pip3 install flask
if [ $? -ne 0 ]
then 
    echo "FATAL: flask downloaded unsuccessfully"
    exit 3
fi

pip3 install flask-login
if [ $? -ne 0 ]
then 
    echo "FATAL: flask-login downloaded unsuccessfully"
    exit 4
fi

pip3 install flask-sqlalchemy
if [ $? -ne 0 ]
then 
    echo "FATAL: flask-sqlalchemy downloaded unsuccessfully"
    exit 5
fi

export DB_PATH=/database/database.db

wget -p /website https://github.com/James-Yu-2007/flask_web_app/archive/refs/tags/v1.0.zip
unzip /website/v1.0.zip
rm /website/v1.0.zip

nohub python3 /website/flask_web_app-1.0/main.py > /var/log/website/console.log