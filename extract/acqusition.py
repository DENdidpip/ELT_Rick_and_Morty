import requests


BASE_URL = "https://rickandmortyapi.com/api"


def extract(endpoint, limit):
    collect = []

    for i in range(1, limit + 1):

        try:
            url = f"{BASE_URL}/{endpoint}/{i}"

            response = requests.get(url)

            if response.status_code == 200:
                data = response.json()
                collect.append(data)

        except Exception as e:
            print(f"Error loading {endpoint} id={i}: {e}")

    return collect

def character_extract():
    return extract(
        endpoint="character",
        limit=826
    )

def episode_extract():
    return extract(
        endpoint="episode",
        limit=51
    )

def location_extract():
    return extract(
        endpoint="location",
        limit=126
    )