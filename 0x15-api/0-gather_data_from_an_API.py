#!/usr/bin/python3

"""A script to get information about a person to do lists."""
import requests
from sys import argv


if __name__ == '__main__':
    userId = argv[1]
    task_titel = []
    user = requests.get("https://jsonplaceholder.typicode.com/users/{}".
                        format(userId)).json()
    tsks = requests.get("https://jsonplaceholder.typicode.com/todos?userId={}".
                        format(userId)).json()
    for task in tsks:
        if task.get('completed') is True:
            task_titel.append(task.get('title'))
    print("Employee {} is done with tasks({}/{}):".
          format(user.get('name'), len(task_titel), len(tsks)))
    for i in task_titel:
        print("\t {}".format(i))
