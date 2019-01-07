import sqlite3

DEFAULT_PATH = 'database.db'


def db_connect(db_path=DEFAULT_PATH):
    connect = sqlite3.connect(db_path)
    return connect


con = db_connect()


def is_user(username, password):
    with con:
        cur = con.cursor()
        cur.execute()
