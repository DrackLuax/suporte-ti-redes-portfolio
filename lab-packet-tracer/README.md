# Laboratórios — Cisco Packet Tracer

Topologias de rede desenvolvidas em Cisco Packet Tracer, aplicando conceitos de segmentação de rede, infraestrutura de acesso (FTTH) e redundância de backbone — temas trabalhados na formação técnica em Redes de Computadores no IFAP.



## Topologia 1 — Rede local com segmentação por VLANs

**Objetivo:** Simular a segmentação de uma rede local em dois departamentos (Financeiro e TI) usando VLANs, demonstrando isolamento de tráfego entre setores dentro da mesma infraestrutura física. O teste confirma que dispositivos da mesma VLAN se comunicam normalmente, enquanto VLANs diferentes ficam isoladas sem um roteador fazendo a interligação — comportamento esperado em redes corporativas segmentadas.

**Equipamentos utilizados:**
- 1 switch Cisco 2960
- 4 PCs
- VLAN 10 (Financeiro) e VLAN 20 (TI)

**Configuração aplicada:** criação de VLANs via CLI, associação de portas de acesso (`switchport access vlan`), endereçamento IP estático por segmento (192.168.10.0/24 e 192.168.20.0/24).

**Teste realizado:** ping entre dispositivos da mesma VLAN (sucesso) e entre VLANs diferentes (falha esperada, confirmando o isolamento).

**Arquivos:** `topologia-1-vlans.pkt` · `topologia-1-vlans.png`· `topologia-1-vlans1.png



## Topologia 2 — Simulação de rede de acesso FTTH

**Objetivo:** Simular a estrutura básica de uma rede de acesso à internet via fibra (FTTH), com um roteador representando a ponta do provedor, um switch representando a rede de distribuição, e PCs representando os clientes finais conectados à rede.

**Equipamentos utilizados:**
- 1 roteador Cisco 1941 (ponta do provedor)
- 1 switch (distribuição)
- 2 PCs (clientes)

**Configuração aplicada:** endereçamento da interface do roteador (192.168.1.1/24), endereçamento dos clientes na mesma sub-rede com gateway apontando para o roteador.

**Teste realizado:** ping dos clientes até o roteador (provedor) e entre clientes, confirmando conectividade de ponta a ponta na rede de acesso simulada.

**Arquivos:** `topologia-2-ftth.pkt` · `topologia-2-ftth.png` · `topologia-2-ftth1.png`


