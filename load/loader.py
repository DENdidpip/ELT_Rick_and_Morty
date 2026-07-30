import json
from extract.acqusition import (
    character_extract,
    location_extract,
    episode_extract
)
from connect_snowflake import get_connection


TABLE_CONFIG = {
    1: {
        "name": "CHARACTER",
        "schema": "character",
        "table": "char",
        "extract": character_extract
    },
    2: {
        "name": "EPISODE",
        "schema": "episode",
        "table": "ep",
        "extract": episode_extract
    },
    3: {
        "name": "LOCATION",
        "schema": "location",
        "table": "loc",
        "extract": location_extract
    }
}

def load_to_snowflake(config):

    conn = get_connection()
    cursor = conn.cursor()

    schema = config["schema"]
    table = config["table"]

    print(f"\nLoading {config['name']}...")

    data = config["extract"]()

    print(f"Records received: {len(data)}")


    insert_query = f"""
        INSERT INTO raw.{schema}.{table}(raw_data)
        SELECT PARSE_JSON(%s)
    """


    for record in data:
        print(record)
        cursor.execute(
            insert_query,
            (json.dumps(record),)
        )


    conn.commit()

    cursor.close()
    conn.close()


    print(f"{config['name']} loaded successfully ✅")

def main():

    print("""
========================
 Rick and Morty Loader
========================

[1] Character
[2] Episode
[3] Location
""")

    choice = int(input("Choose table: "))

    if choice not in TABLE_CONFIG:
        print("Wrong option")
        return

    config = TABLE_CONFIG[choice]
    load_to_snowflake(config)

main()