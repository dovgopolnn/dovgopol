import request_sender
import test_data
# Довгопол Денис, 10-й поток — Финальный проект. Инженер по тестированию плюс
def test_get_order_by_track():
    track = request_sender.create_order()
    response = request_sender.get_order_details(trackNumber=track)
    assert response['order'] is not None
    order = response['order']
    assert order['firstName'] == test_data.order_body['firstName']
    assert order['phone'] == test_data.order_body['phone']

