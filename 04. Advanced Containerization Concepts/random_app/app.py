import random
from flask import Flask, render_template


app = Flask(__name__)

quotes = ['Koi sega e nomer 1 - Bi4eto',
          'Ima li, ima li debeli jeni? - Kilata',
          'Kaji mi ima li debeli jzheni? - Kilata',
          'Koito pie, toj pikae - Leibnitz', 'Az sym nai-dobriq r&b izpalnitel - Bi4eto']


def main():
    quote = random.choice(quotes)
    print(quote)

if __name__ == "__main__":
    main()