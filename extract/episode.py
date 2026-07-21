import requests

def episode_extract():
        collect = []
        for i in range(1, 100):
            try:
                url = f"https://rickandmortyapi.com/api/episode/{i}"
                response = requests.get(url)
                data = response.json()

                collect.append(data)
            except:
                pass
        return collect
