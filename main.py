from website import create_app
import os

app = create_app()

LOCAL_IP = os.environ['LOCAL_IP']

LOCAL_IP = LOCAL_IP.split()

if __name__ == '__main__':
    app.run(host=LOCAL_IP[0], debug=True)
