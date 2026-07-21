import requests

def location_extract():
    collect = []
    for i in range(1, 200):
        try:
            url = f"https://rickandmortyapi.com/api/location/{i}"
            response = requests.get(url)
            data = response.json()

            collect.append(data)
        except:
            pass
    return collect
