import pika;

parameters = pika.ConnectionParameters(host='localhost')
connection = pika.BlockingConnection(parameters)

channel = connection.channel()
channel.exchange_declare(exchange='logs', exchange_type='fanout')
channel.basic_publish(exchange='logs', routing_key='', body='new string message!')

print('Sent \'new string message!\'')

connection.close()