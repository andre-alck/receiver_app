# flutter_amqp

Para testes manuais:

1. Criar arquivo *.py.
2. Baixar e instalar a biblioteca "pika";
3. Adicionar o seguinte código no arquivo criado:

```py
import pika;

parameters = pika.ConnectionParameters(host='localhost')
connection = pika.BlockingConnection(parameters)

channel = connection.channel()
channel.exchange_declare(exchange='logs', exchange_type='fanout')
channel.basic_publish(exchange='logs', routing_key='', body='new string message!')

print('Sent \'new string message!\'')

connection.close()
```

4. Executar tanto o aplicativo quanto o script.