from website import create_app
import os
import time

app = create_app()

LOCAL_IP = os.environ['LOCAL_IP']

LOCAL_IP = LOCAL_IP.split()

if __name__ == '__main__':
    app.run(host=LOCAL_IP[0], debug=True)

time.sleep(10)
listeningOrNot = os.environ['listeningOrNot']
listeningOrNot = listeningOrNot.split()
def listen():
    for i in listeningOrNot:
        if i == "LISTEN":
            return True
if listen():
    print("the 5000 port is listening")
