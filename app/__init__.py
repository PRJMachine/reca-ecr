from flask import Flask

app = Flask(__name__)  # 파일 이름과 같은 Flask 앱 객체를 만듭니다

@app.route("/")  # "/" 경로로 들어오면 이 함수를 마주칩니다
def hello():
    return "[prod]Hellddow, WWorld!"  # "/" 경로로 들어오면 "Hello, World!"를 출력합니다