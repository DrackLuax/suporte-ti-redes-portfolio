# Resolução de Conflito de IP na Rede

## Problema

Windows exibe o aviso "Endereço IP em conflito com outro sistema na rede" ou a conexão de rede cai intermitentemente para um ou mais dispositivos, mesmo com a rede aparentemente estável.

## Diagnóstico

1. Identificar quais dispositivos estão usando o mesmo endereço IP — geralmente ocorre quando há IPs estáticos configurados manualmente dentro da faixa do DHCP, ou quando dois servidores DHCP estão ativos na mesma rede.
2. Verificar a tabela ARP para localizar quais MACs estão respondendo pelo mesmo IP.
3. Confirmar se o dispositivo em conflito está com IP estático ou dinâmico.

## Solução

- Se o conflito for entre um dispositivo com IP estático e a faixa do DHCP, mover o IP estático para fora da faixa reservada ao DHCP, ou criar uma reserva de IP no próprio servidor DHCP.
- Se houver dois servidores DHCP ativos na rede (comum quando alguém conecta um roteador extra sem desativar o DHCP dele), desativar o DHCP duplicado, mantendo apenas um ativo.
- Renovar o IP nos dispositivos afetados após a correção.

## Comandos usados

```
arp -a
ipconfig /all
ipconfig /release
ipconfig /renew
ping -a [IP em conflito]
```
