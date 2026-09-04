# Scripts de Suporte Técnico

Scripts de automação voltados para tarefas do dia a dia de um técnico de suporte: coleta rápida de informações da máquina, diagnóstico de rede e geração de relatórios para anexar em chamados.

<img width="1422" height="625" alt="inventario-maquina-screenshot" src="https://github.com/user-attachments/assets/935c2f9d-5b99-482e-a5f4-efde08896f5d" />


## `inventario-maquina.ps1`

Script em PowerShell que coleta, em poucos segundos, as informações essenciais de uma estação de trabalho Windows — útil tanto para diagnóstico rápido em campo quanto para documentar um chamado de suporte técnico.

### O que ele coleta

| Categoria | Informação |
|---|---|
| Identificação | Nome do computador e usuário logado |
| Sistema | Sistema operacional, versão e arquitetura |
| Rede | Endereço IP, adaptador de rede ativo e gateway |
| Armazenamento | Espaço livre e total de cada disco |
| Memória | RAM total e disponível |
| Conectividade | Teste rápido de acesso à internet |

### Requisitos

- Windows 10 ou superior
- PowerShell executado **como administrador**
- Nenhuma dependência externa — usa apenas módulos nativos do Windows (`CimInstance`, `Test-Connection`)

### Como executar

Abra o PowerShell como administrador, navegue até a pasta do script e rode:

```powershell
.\inventario-maquina.ps1
```

### Exemplo de saída

```
===== INVENTARIO DE MAQUINA =====

Computador: DESKTOP-A1B2C3
Usuario logado: joao.silva

Sistema Operacional: Microsoft Windows 10 Pro
Versao: 10.0.19045
Arquitetura: 64-bit

--- Rede ---
Adaptador: Ethernet
IP: 192.168.1.105
Gateway: 192.168.1.1

--- Discos ---
Unidade C: - Livre: 128.4 GB de 476 GB

--- Memoria RAM ---
Total: 15.89 GB
Livre: 6.2 GB

--- Teste de Conectividade ---
Internet: OK

===== FIM DO RELATORIO =====
```

### Salvando o relatório em arquivo

Para anexar o resultado em um chamado ou ticket de suporte, exporte a saída direto para um `.txt`:

```powershell
.\inventario-maquina.ps1 | Out-File "relatorio-$env:COMPUTERNAME.txt"
```

O arquivo é salvo com o nome da máquina, facilitando identificar de qual estação veio o relatório quando há vários chamados abertos ao mesmo tempo.

### Possíveis melhorias futuras

- Exportar em formato `.csv` para consolidar vários relatórios numa planilha
- Adicionar verificação de espaço em disco abaixo de um limite (alerta automático)
- Incluir versão do antivírus e status das atualizações do Windows
