from website import create_app
import os
import time

app = create_app()

LOCAL_IP = os.environ['LOCAL_IP']

LOCAL_IP = LOCAL_IP.split()

if __name__ == '__main__':
    app.run(host=LOCAL_IP[0], debug=True)

time.sleep(15)
listeningOrNot = os.environ['listeningOrNot']
listeningOrNot = listeningOrNot.split()

def listen():
    for i in listeningOrNot:
        if i == "LISTEN":
            return True
    return False

if listen():
    print("the 5000 port is listening")
else:
    print("the 5000 port is not listening")
