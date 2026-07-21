import requests
import pandas as pd
def character_extract():
    collect = []
    for i in range(1, 700):
        try:
            url = f"https://rickandmortyapi.com/api/character/{i}"
            response = requests.get(url)
            data = response.json()

            collect.append(data)
        except:
            pass
    return collect
