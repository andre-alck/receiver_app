import pika;

parameters = pika.ConnectionParameters(host='localhost')
connection = pika.BlockingConnection(parameters)

channel = connection.channel()
channel.queue_declare(queue='topic')

channel.basic_publish(exchange='', routing_key='topic', body='hello, world!')

print('Sent \'hello, world!\'')

connection.close()