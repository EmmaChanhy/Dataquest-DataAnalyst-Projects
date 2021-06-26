import requests

headers = {"Authorization": "X", "User-Agent": "Y"}
payload = {"t":"day"}
response = requests.get("https://oauth.reddit.com/r/python/top", headers=headers, params=payload)
python_top = response.json()

#Get the most voted post id
python_top_articles = python_top["data"]["children"]
most_upvoted = ""
most_upvotes = 0
for article in python_top_articles:
    ar = article["data"]
    if ar["ups"] >= most_upvotes:
        most_upvoted = ar["id"]
        most_upvotes = ar["ups"]

#Get the post comments
response = requests.get("https://oauth.reddit.com/r/python/comments/4b7w9u", headers=headers)
comments = response.json()

#Get the most voted comments
comments_list = comments[1]["data"]["children"]
most_upvoted_comment = ""
most_upvotes_comment = 0
for comment in comments_list:
    co = comment["data"]
    if co["ups"] >= most_upvotes_comment:
        most_upvoted_comment = co["id"]
        most_upvotes_comment = co["ups"]

#Upvote the most upvoted comment
payload = {"dir": 1, "id": "d16y4ry"}
headers = {"Authorization": "X", "User-Agent": "Y"}
response = requests.post("https://oauth.reddit.com/api/vote", json=payload, headers=headers)
status = response.status_code