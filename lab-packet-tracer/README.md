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

**Arquivos:** `topologia-1-vlans.pkt` · `topologia-1-vlans.png`· `topologia-1-vlans1.png`

<img width="495" height="451" alt="topologia-1-vlans" src="https://github.com/user-attachments/assets/e31689e8-c573-46e4-930c-b7909bd57858" />
<img width="627" height="381" alt="topologia-1-vlans1" src="https://github.com/user-attachments/assets/18bb0043-5a87-4d57-a323-66927eff3422" />


## Topologia 2 — Simulação de rede de acesso FTTH

**Objetivo:** Simular a estrutura básica de uma rede de acesso à internet via fibra (FTTH), com um roteador representando a ponta do provedor, um switch representando a rede de distribuição, e PCs representando os clientes finais conectados à rede.

**Equipamentos utilizados:**
- 1 roteador Cisco 1941 (ponta do provedor)
- 1 switch (distribuição)
- 2 PCs (clientes)

**Configuração aplicada:** endereçamento da interface do roteador (192.168.1.1/24), endereçamento dos clientes na mesma sub-rede com gateway apontando para o roteador.

**Teste realizado:** ping dos clientes até o roteador (provedor) e entre clientes, confirmando conectividade de ponta a ponta na rede de acesso simulada.

**Arquivos:** `topologia-2-ftth.pkt` · `topologia-2-ftth.png` · `topologia-2-ftth1.png`

<img width="528" height="442" alt="topologia-2-ftth" src="https://github.com/user-attachments/assets/e18d8ae2-907e-45f8-9497-535627c0eb9f" />
<img width="662" height="522" alt="topologia-2-ftth1" src="https://github.com/user-attachments/assets/84f6a009-75f0-4664-8d50-c86b8e90624b" />




