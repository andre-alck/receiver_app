# flutter_amqp

Para testes manuais:

1. Criar arquivo *.py.
2. Baixar e instalar a biblioteca "pika";
3. Adicionar o seguinte código no arquivo criado:

```py
import pika;

connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))

channel = connection.channel()
channel.queue_declare(queue='topic')

channel.basic_publish(exchange='', routing_key='topic', body='hello, world!')
print('Sent \'hello, world!\'')

connection.close()
```

4. Executar tanto o aplicativo quanto o script.