import requests
import configuration
import test_data


def create_order():
    response = requests.post(configuration.ORDER_URL,
                             json=test_data.order_body)
    # headers=data.headers)
    assert response.status_code == 201
    return response.json()['track']


def get_order_details(trackNumber):
    response = requests.get(configuration.ORDER_URL + "/track", params={"t": trackNumber})
    assert response.status_code == 200
    return response.json()
