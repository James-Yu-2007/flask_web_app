from website import create_app
import socket
import os

app = create_app()

LOCAL_IP = os.environ['LOCAL_IP']

if __name__ == '__main__':
    app.run(host=LOCAL_IP, debug=True)