import snowflake.connector
import os
from dotenv import load_dotenv
from pathlib import Path

def get_connection():
    ENV_PATH = Path(__file__).parent.parent / ".env"
    load_dotenv(ENV_PATH)

    return snowflake.connector.connect(
        user=os.getenv("USER_SF"),
        password=os.getenv("PASSWORD_SF"),
        account=os.getenv("ACCOUNT_SF"),
        warehouse="RICK_AND_MORTY",
        database="RAW"
    )