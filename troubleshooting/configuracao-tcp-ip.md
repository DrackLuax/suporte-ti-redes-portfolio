# Configuração e Diagnóstico de TCP/IP

## Problema

Estação de trabalho sem acesso à rede ou à internet, mesmo com o cabo de rede conectado ou Wi-Fi ativo. Sintomas comuns: "sem acesso à internet", IP na faixa `169.254.x.x` (APIPA), ou impossibilidade de acessar outros dispositivos da rede.

## Diagnóstico

1. Verificar se a placa de rede está habilitada e o cabo/conexão física está íntegra.
2. Verificar se o computador está recebendo um endereço IP válido do servidor DHCP ou se está com IP estático mal configurado.
3. Testar conectividade básica com a própria máquina, com o gateway e com a internet, em ordem — isso isola se o problema é local, na rede interna, ou externo.
4. Verificar se o DNS está resolvendo nomes de domínio corretamente.

## Solução

- Se o IP estiver na faixa `169.254.x.x`, o problema é falha de comunicação com o DHCP — renovar a concessão de IP costuma resolver.
- Se o IP estático estiver incorreto (máscara, gateway ou faixa errada), corrigir manualmente nas propriedades de rede.
- Se o DNS não resolver nomes mas o IP responder normalmente, ajustar o servidor DNS (ex: usar `8.8.8.8` como teste).
- Reiniciar o adaptador de rede resolve boa parte dos travamentos de driver.

## Comandos usados

```
ipconfig /all
ipconfig /release
ipconfig /renew
ipconfig /flushdns
ping 127.0.0.1
ping [IP do gateway]
ping 8.8.8.8
nslookup google.com
```
