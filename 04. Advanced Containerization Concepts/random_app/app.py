import random, os
from flask import Flask, render_template


app = Flask(__name__)

quotes = ['Koi sega e nomer 1 - Bi4eto',
          'Ima li, ima li debeli jeni? - Kilata',
          'Kaji mi ima li debeli jzheni? - Kilata',
          'Koito pie, toj pikae - Leibnitz', 'Az sym nai-dobriq r&b izpalnitel - Bi4eto']


@app.route("/")
def index():
    quote = random.choice(quotes)
    #print(quote)
    return render_template("index.html", quote=quote)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.environ.get("PORT", 3000)))