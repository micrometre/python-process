from flask import Flask, render_template, Response, request, jsonify, redirect, url_for, send_file

app = Flask(__name__, static_url_path='/static')


@app.route('/')
def index():
    return render_template('index.html')


@app.route("/alprd", methods=["POST"])
def alprd():
    data = request.get_json()
    alpr_results = data["results"]
    alpr_uuid = data["uuid"]
    alpr_plate = alpr_results[0]["plate"]
    print(alpr_uuid)
    return("alprd")


@app.route("/watch", methods=["POST"])
def watch():
    data = request.get_data()
    print(data)
    return(data)

@app.route("/video")
def video():
    return send_file("static/video.mp4")

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')