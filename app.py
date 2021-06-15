import os

from flask import Flask, jsonify
from flask_pymongo import PyMongo

from backends.mongo import find_records, MongoJSONEncoder, ObjectIdConverter

app = Flask(__name__)
app.config['MONGO_URI'] = os.environ.get('MONGO_URI')
app.json_encoder = MongoJSONEncoder
app.url_map.converters['objectid'] = ObjectIdConverter

mongo = PyMongo(app)


@app.route('/api/v1/records')
def records():
    return jsonify(find_records(mongo))


@app.route('/api/v1/records/<id>')
def record(id):
    response = find_records(mongo, id)
    if response:
        return jsonify(response[0])
    else:
        return {}, 204


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=False, port=8080)
