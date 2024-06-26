from flask import Flask, render_template, Response, json, request, jsonify, redirect, url_for, send_file

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
    print(alpr_uuid, alpr_plate)
    return("alprd")


@app.route("/watch", methods=["POST"])
def watch():
    data = request.get_data()
    alprd_img_res = ("{}".format(data))
    a = json.dumps(alprd_img_res)
    b = json.loads(a)
    c = b[2:][:-1]
    alpr_img = ("http://192.168.1.122:5000/{}".format(c))
    print(alpr_img)
    return("22")

@app.route("/video")
def video():
    return send_file("static/video.mp4")

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')